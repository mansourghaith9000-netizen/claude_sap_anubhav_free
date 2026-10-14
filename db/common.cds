// ===========================================================================
// common.cds
// Reusable artifacts for the Vacation & Traveller Management application:
// code lists and the association types that point to them.
// This file is the single source of truth for these definitions; business
// entities live in schema.cds.
// ===========================================================================

namespace anubhav.claude;

using {
  sap,
  cuid
} from '@sap/cds/common';

// ---------------------------------------------------------------------------
// Code lists
// ---------------------------------------------------------------------------

/** Address types, e.g. H = Home, O = Office, P = Permanent, T = Temporary */
entity AddressTypes : sap.common.CodeList {
  key code : String(1) @title: '{i18n>AddressTypeCode}';
}

/** Traveller statuses, e.g. A = Active, I = Inactive, S = Suspended */
entity TravellerStatus : sap.common.CodeList {
  key code : String(1) @title: '{i18n>TravellerStatusCode}';
}

/** Application roles, e.g. ADMIN, TRAVELLER, AGENT */
entity Roles : sap.common.CodeList {
  key code : String(10) @title: '{i18n>RoleCode}';
}

// ---------------------------------------------------------------------------
// Reusable types
// ---------------------------------------------------------------------------

type AddressType : Association to AddressTypes;
type Status      : Association to TravellerStatus;
type Role        : Association to Roles;

// ---------------------------------------------------------------------------
// Titles for inherited elements without one in @sap/cds/common
// ---------------------------------------------------------------------------

annotate cuid with {
  ID @title: '{i18n>ID}';
}
