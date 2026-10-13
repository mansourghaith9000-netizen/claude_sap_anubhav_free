namespace anubhav.claude;

using {
  sap,
  cuid,
  Currency,
  managed
} from '@sap/cds/common';

// ---------------------------------------------------------------------------
// Code lists
// ---------------------------------------------------------------------------

/** Address types, e.g. H = Home, O = Office, P = Permanent, T = Temporary */
entity AddressTypes : sap.common.CodeList {
  key code : String(1);
}

/** Traveller statuses, e.g. A = Active, I = Inactive, S = Suspended */
entity TravellerStatus : sap.common.CodeList {
  key code : String(1);
}

// ---------------------------------------------------------------------------
// Main entities
// ---------------------------------------------------------------------------

entity Destinations : cuid {
  address    : String(255);
  city       : String(40);
  postalCode : String(8);
  country    : String(40);
  traveller  : Association to Travellers;
}

entity Travellers : cuid, managed {
  username  : String(255) @mandatory;
  firstName : String(255);
  lastName  : String(255);
  contacts  : Composition of many Contacts
                on contacts.traveller = $self;
  gender    : String(10);
  age       : Integer;
  status    : Association to TravellerStatus default 'A';
  vacations : Composition of many Vacations
                on vacations.traveller = $self;
}

annotate Travellers with {
  modifiedAt @odata.etag;
}

entity Contacts : cuid {
  type      : Association to AddressTypes;
  address   : String(255);
  traveller : Association to Travellers;
}

entity Vacations : cuid {
  name        : String(255);
  budget      : Decimal(10, 2);
  currency    : Currency;
  description : String(1024);
  startsAt    : DateTime;
  endsAt      : DateTime;
  traveller   : Association to Travellers;
}

// ---------------------------------------------------------------------------
// User management
// ---------------------------------------------------------------------------

/** Application roles, e.g. ADMIN, TRAVELLER, AGENT */
entity Roles : sap.common.CodeList {
  key code : String(10);
}

entity AppUsers : cuid, managed {
  username    : String(100) @mandatory;
  email       : String(255) @mandatory;
  fullName    : String(255);
  role        : Association to Roles;
  isActive    : Boolean default true;
  lastLoginAt : DateTime;
  /** Optional link if the user is also a traveller */
  traveller   : Association to Travellers;
}
