enhance my @db/schema.cds file with following entities at the end.

1. entity Roles extending sap.common.codelist: 
- key code: string10
- will store role values: admin, traveller, Agent

2. Entity AppUsers using cuid and managed:
- username: string100 with @mandatory annotation
- email: string255 with @mandatory annotation
fullname: string255
- role: association to roles
-isActive: Boolean default true
- lastloginat: datetime
- traveller: association to travellers
(optional link if user is a traveller)

Generate the comlete schema.cds file with proper sytax, indentation, and sap cap best practices.
if there are merge conflicts during pull, STOP ans ask me how to proceed.