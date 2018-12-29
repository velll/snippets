---
title: 'Using xml schemas to serialize objects'
---
Clear xml schemas first
```sql
begin
  DBMS_XMLSCHEMA.DELETESCHEMA(
     schemaurl => 'http://localhost/xdb/<whatever>/somethingSerializer.xsd');
end;
/
begin
  DBMS_XMLSCHEMA.DELETESCHEMA(
     schemaurl => 'http://localhost/xdb/l<whatever>/somethingSingleSerializer.xsd');
end;
/
```

Create new xml schemas
```sql
/*
 serializing simple object with fields:

 OBJECT_ID                         VARCHAR2(500)
 BEGIN_DATE                        VARCHAR2(500)

 and collection of such objects
*/

/*
 xdb path is something like
 'http://localhost/xdb/whatever/'

 we will store the xml schema under this path
*/

-- Schema for single object
BEGIN
  DBMS_XMLSCHEMA.registerSchema(
    SCHEMAURL => :xdb_path || '/somethingSingleSerializer.xsd',
    SCHEMADOC => '
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="something">
    <xs:complexType>
      <xs:sequence>
        <xs:element type="xs:string" name="OBJECT_ID"/>
        <xs:element type="xs:string" name="BEGIN_DATE"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>',
    GENTABLES => FALSE,
    OWNER     => :owner);
END;
/

-- Schema for collection
BEGIN
  DBMS_XMLSCHEMA.registerSchema(
    SCHEMAURL => :xdb_path || '/somethingSerializer.xsd',
    SCHEMADOC => '
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="something_serializer">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="objects">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="something" maxOccurs="500">
                <xs:complexType>
                  <xs:sequence>
                    <xs:element type="xs:string" name="OBJECT_ID"/>
                    <xs:element type="xs:string" name="BEGIN_DATE"/>
                  </xs:sequence>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>',
    GENTABLES => FALSE,
    OWNER     => :owner);
END;
/
```

Create objects
```sql
CREATE OR REPLACE TYPE "something" FORCE AS OBJECT(
  OBJECT_ID                         VARCHAR2(400),
  BEGIN_DATE                        VARCHAR2(400),

  CONSTRUCTOR FUNCTION "something"(
    clb_SERIALIZED_SOMETHING        CLOB)
  RETURN SELF AS RESULT,

  MEMBER FUNCTION SERIALIZE
  RETURN CLOB)
/

CREATE OR REPLACE TYPE BODY "something" AS
  CONSTRUCTOR FUNCTION "something"(
    clb_SERIALIZED_SOMETHING        CLOB)
  RETURN SELF AS RESULT
  AS
  BEGIN
    XMLType(clb_SERIALIZED_SOMETHING).toObject(
                                        object => SELF,
                                        schema => :xdb_path || '/somethingSingleSerializer.xsd',
                                        element => 'something');

    RETURN;
  END;

  MEMBER FUNCTION SERIALIZE
  RETURN CLOB
  AS
  BEGIN
    RETURN XMLType(
         xmlData => SELF,
         schema  => :xdb_path || '/somethingSingleSerializer.xsd',
         element => 'something').getClobVal();
  END;
end;
/
CREATE OR REPLACE TYPE "something_list" FORCE AS TABLE OF "something";
/
CREATE OR REPLACE TYPE "something_serializer" FORCE AS OBJECT(
  "objects"                           "something_list",

  CONSTRUCTOR FUNCTION "something_serializer"
  RETURN SELF AS RESULT,

  CONSTRUCTOR FUNCTION "something_serializer"(
    clb_SERIALIZED_SOMETHING       CLOB)
  RETURN SELF AS RESULT,

  -- Converts to xml with all safety escapes.
  -- %return XML string
  MEMBER FUNCTION SERIALIZE
  RETURN CLOB)
/
CREATE OR REPLACE TYPE BODY "something_serializer" AS
  CONSTRUCTOR FUNCTION "something_serializer"
  RETURN SELF AS RESULT
  AS
  BEGIN
    SELF."objects" := "something_list"(
                         "something"(12, sysdate),
                         "something"(12, sysdate-5));

    RETURN;
  END;

  -- =============================================================================
  -- Converts to xml with all safety escapes.
  MEMBER FUNCTION SERIALIZE
  RETURN CLOB
  AS
  BEGIN
    RETURN XMLType(
             xmlData => SELF,
             schema  => :xdb_path || '/somethingSerializer.xsd',
             element => 'something_serializer').getClobVal();
  END SERIALIZE;
  -- =============================================================================
  CONSTRUCTOR FUNCTION "something_serializer"(
    clb_SERIALIZED_SOMETHING       CLOB)
  RETURN SELF AS RESULT
  AS
  BEGIN
    XMLType(clb_SERIALIZED_SOMETHING).toObject(
                                           object => SELF,
                                           schema => :xdb_path || '/somethingSerializer.xsd',
                                           element => 'something_serializer');

    RETURN;
  END;
END;
/
```
