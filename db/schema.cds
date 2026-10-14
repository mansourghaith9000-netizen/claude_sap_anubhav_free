namespace anubhav.claude;

using {
  cuid,
  Currency,
  managed
} from '@sap/cds/common';

using {
  anubhav.claude.AddressType,
  anubhav.claude.Status,
  anubhav.claude.Role
} from './common';

// ---------------------------------------------------------------------------
// Main entities
// ---------------------------------------------------------------------------

entity Destinations : cuid {
  address    : String(255)               @title: '{i18n>Address}';
  city       : String(40)                @title: '{i18n>City}';
  postalCode : String(8)                 @title: '{i18n>PostalCode}';
  country    : String(40)                @title: '{i18n>Country}';
  traveller  : Association to Travellers @title: '{i18n>Traveller}';
}

entity Travellers : cuid, managed {
  username  : String(255) @mandatory @title: '{i18n>Username}';
  firstName : String(255)            @title: '{i18n>FirstName}';
  lastName  : String(255)            @title: '{i18n>LastName}';
  @title: '{i18n>Contacts}'
  contacts  : Composition of many Contacts
                on contacts.traveller = $self;
  gender    : String(10)             @title: '{i18n>Gender}';
  age       : Integer                @title: '{i18n>Age}';
  status    : Status default 'A'     @title: '{i18n>Status}';
  @title: '{i18n>Vacations}'
  vacations : Composition of many Vacations
                on vacations.traveller = $self;
}

annotate Travellers with {
  modifiedAt @odata.etag;
}

entity Contacts : cuid {
  type      : AddressType               @title: '{i18n>AddressType}';
  address   : String(255)               @title: '{i18n>Address}';
  traveller : Association to Travellers @title: '{i18n>Traveller}';
}

entity Vacations : cuid {
  name        : String(255)               @title: '{i18n>VacationName}';
  budget      : Decimal(10, 2)            @title: '{i18n>Budget}';
  currency    : Currency                  @title: '{i18n>Currency}';
  description : String(1024)              @title: '{i18n>Description}';
  startsAt    : DateTime                  @title: '{i18n>StartsAt}';
  endsAt      : DateTime                  @title: '{i18n>EndsAt}';
  traveller   : Association to Travellers @title: '{i18n>Traveller}';
}

// ---------------------------------------------------------------------------
// User management
// ---------------------------------------------------------------------------

entity AppUsers : cuid, managed {
  username    : String(100) @mandatory  @title: '{i18n>Username}';
  email       : String(255) @mandatory  @title: '{i18n>Email}';
  fullName    : String(255)             @title: '{i18n>FullName}';
  role        : Role                    @title: '{i18n>Role}';
  isActive    : Boolean default true    @title: '{i18n>IsActive}';
  lastLoginAt : DateTime                @title: '{i18n>LastLoginAt}';
  /** Optional link if the user is also a traveller */
  traveller   : Association to Travellers @title: '{i18n>Traveller}';
}
