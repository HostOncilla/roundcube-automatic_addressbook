CREATE TABLE "collected_contacts" (
    "contact_id" integer PRIMARY KEY,
    "user_id" integer NOT NULL
        REFERENCES "users" ("user_id") ON DELETE CASCADE,
    "changed" timestamp with time zone DEFAULT current_timestamp NOT NULL,
    "del" smallint DEFAULT 0 NOT NULL,
    "name" varchar(128) DEFAULT NULL,
    "email" varchar(4000) DEFAULT NULL,
    "firstname" varchar(128) DEFAULT NULL,
    "surname" varchar(128) DEFAULT NULL,
    "vcard" long,
    "words" varchar(4000)
);

CREATE INDEX "collected_contacts_user_id_idx" ON "collected_contacts" ("user_id", "del");

CREATE SEQUENCE "collected_contacts_seq"
    START WITH 1 INCREMENT BY 1 NOMAXVALUE;

CREATE TRIGGER "collected_contacts_seq_trig"
BEFORE INSERT ON "collected_contacts" FOR EACH ROW
BEGIN
    :NEW."contact_id" := "collected_contacts_seq".nextval;
END;
/
