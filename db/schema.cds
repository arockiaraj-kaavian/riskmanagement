namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

/**
 * new type data model
 */
entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    priority : String(5);
    description : String(100);
    impact : Integer;
    criticality : Integer;
    mitigations : Association to one Mitigations;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigations : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.mitigations = $self;
}
