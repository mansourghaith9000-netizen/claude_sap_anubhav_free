Generate test data csv files for a asap cap application with namespace
"anubhav.claude" for travel managment. create the following csv files
inside a folder clled "db/data/ following sap cap naming convention
(namespace-Entityname.csv).

Required csv Filies:

1. file: anubhav.claude-addresstypes.csv
- columns: code, name , descr
- generate 4 records:
h, home, home address for personal communication
o, office, work adress for business comunication
p, permanent, permanent residential adress
t, temporary, temporary stay address

2. file: anubhav.claude-addresstypes_texts.csv
- columns: locale, code, name, descr
- generate localization records for englisch and german
for all 4 address types

3. file: anubhav.claude-travellerstatus.csv
- columns: code, name, descr
- generate 4 records:
a, active, avtive traveller
i, inactive, inactive traveller
s, suspended, suspended traveller
p, pending, pending verfication

4. file; anunhav.claude-roles.csv
- colums: code, name, desce
- generate3 records
admin, adminstartor, fill systemm access
traveller, traveller, self-service traveller access
Agent, travel agent, agent access for managing travellers

5.
 for andere entitys make the same with some randoms records.

 Important: use semicolon ; as csv seperator sap cap standard
 first row must contain column headers
 use uuid format consistently across related entities
 ensure referntial integrity
 use iso 8601 format for all datetime field
