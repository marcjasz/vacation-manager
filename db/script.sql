
CREATE TABLE counselor (
    pesel          VARCHAR2(11) NOT NULL,
    name           VARCHAR2(20) NOT NULL,
    surname        VARCHAR2(40) NOT NULL,
    address        VARCHAR2(50) NOT NULL,
    phone_number   VARCHAR2(12) NOT NULL
);

ALTER TABLE counselor ADD CONSTRAINT counselor_pk PRIMARY KEY ( pesel );

CREATE TABLE "Group" (
    id              INTEGER NOT NULL,
    vacation_name   VARCHAR2(50) NOT NULL
);

ALTER TABLE "Group" ADD CONSTRAINT group_pk PRIMARY KEY ( id );

CREATE TABLE group_supervision (
    counselor_pesel   VARCHAR2(11) NOT NULL,
    group_id          INTEGER NOT NULL
);

ALTER TABLE group_supervision ADD CONSTRAINT group_supervision_pk PRIMARY KEY ( counselor_pesel,
                                                                                group_id );

CREATE TABLE hosting (
    group_id       INTEGER NOT NULL,
    lodging_name   VARCHAR2(50) NOT NULL
);

ALTER TABLE hosting ADD CONSTRAINT hosting_pk PRIMARY KEY ( group_id,
                                                            lodging_name );

CREATE TABLE invoice (
    invoice_number         INTEGER NOT NULL,
    "date"                 DATE NOT NULL,
    amount                 NUMBER(12, 2) NOT NULL,
    service_provider_nip   VARCHAR2(10) NOT NULL,
    organizer_nip          VARCHAR2(10) NOT NULL,
    vacation_name          VARCHAR2(50) NOT NULL,
    service                VARCHAR2(100) NOT NULL
);

ALTER TABLE invoice ADD CONSTRAINT invoice_amount_positive CHECK ( amount > 0 );

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( invoice_number );

CREATE TABLE lodging (
    name           VARCHAR2(50) NOT NULL,
    address        VARCHAR2(50) NOT NULL,
    capacity       INTEGER NOT NULL,
    owner          VARCHAR2(50) NOT NULL,
    phone_number   VARCHAR2(12) NOT NULL,
    email          VARCHAR2(40),
    company        VARCHAR2(50) NOT NULL
);

ALTER TABLE lodging ADD CONSTRAINT lodging_pk PRIMARY KEY ( name );

CREATE TABLE organizer (
    nip            VARCHAR2(10) NOT NULL,
    name           VARCHAR2(50) NOT NULL,
    address        VARCHAR2(50) NOT NULL,
    phone_number   VARCHAR2(12) NOT NULL,
    email          VARCHAR2(40)
);

ALTER TABLE organizer ADD CONSTRAINT organizer_pk PRIMARY KEY ( nip );

CREATE TABLE participant (
    pesel          VARCHAR2(11) NOT NULL,
    name           VARCHAR2(20) NOT NULL,
    surname        VARCHAR2(40) NOT NULL,
    school         VARCHAR2(100),
    phone_number   VARCHAR2(12) NOT NULL
);

ALTER TABLE participant ADD CONSTRAINT participant_pk PRIMARY KEY ( pesel );

CREATE TABLE participation (
    participant_pesel   VARCHAR2(11) NOT NULL,
    group_id            INTEGER NOT NULL
);

ALTER TABLE participation ADD CONSTRAINT participation_pk PRIMARY KEY ( participant_pesel,
                                                                        group_id );

CREATE TABLE payment (
    id                  INTEGER NOT NULL,
    amount              NUMBER(12, 2) NOT NULL,
    "date"              DATE NOT NULL,
    participant_pesel   VARCHAR2(11) NOT NULL,
    group_id            INTEGER NOT NULL
);

ALTER TABLE payment ADD CONSTRAINT payment_amount_positive CHECK ( amount > 0 );

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( id );

CREATE TABLE service_provider (
    nip            VARCHAR2(10) NOT NULL,
    address        VARCHAR2(50) NOT NULL,
    name           VARCHAR2(50) NOT NULL,
    phone_number   VARCHAR2(12) NOT NULL,
    email          VARCHAR2(40) NOT NULL
);

ALTER TABLE service_provider ADD CONSTRAINT service_provider_pk PRIMARY KEY ( nip );

CREATE TABLE vacation (
    name            VARCHAR2(50) NOT NULL,
    organizer_nip   VARCHAR2(10) NOT NULL,
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL
);

ALTER TABLE vacation ADD CONSTRAINT vacation_date_order CHECK ( start_date <= end_date );

ALTER TABLE vacation ADD CONSTRAINT vacation_pk PRIMARY KEY ( name );

ALTER TABLE group_supervision
    ADD CONSTRAINT group_supervision_counselor_fk FOREIGN KEY ( counselor_pesel )
        REFERENCES counselor ( pesel );

ALTER TABLE group_supervision
    ADD CONSTRAINT group_supervision_group_fk FOREIGN KEY ( group_id )
        REFERENCES "Group" ( id );

ALTER TABLE "Group"
    ADD CONSTRAINT group_vacation_fk FOREIGN KEY ( vacation_name )
        REFERENCES vacation ( name );

ALTER TABLE hosting
    ADD CONSTRAINT hosting_group_fk FOREIGN KEY ( group_id )
        REFERENCES "Group" ( id );

ALTER TABLE hosting
    ADD CONSTRAINT hosting_lodging_fk FOREIGN KEY ( lodging_name )
        REFERENCES lodging ( name );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_organizer_fk FOREIGN KEY ( organizer_nip )
        REFERENCES organizer ( nip );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_service_provider_fk FOREIGN KEY ( service_provider_nip )
        REFERENCES service_provider ( nip );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_vacation_fk FOREIGN KEY ( vacation_name )
        REFERENCES vacation ( name );

ALTER TABLE participation
    ADD CONSTRAINT participation_group_fk FOREIGN KEY ( group_id )
        REFERENCES "Group" ( id );

ALTER TABLE participation
    ADD CONSTRAINT participation_participant_fk FOREIGN KEY ( participant_pesel )
        REFERENCES participant ( pesel );

ALTER TABLE payment
    ADD CONSTRAINT payment_participation_fk FOREIGN KEY ( participant_pesel,
                                                          group_id )
        REFERENCES participation ( participant_pesel,
                                   group_id );

ALTER TABLE vacation
    ADD CONSTRAINT vacation_organizer_fk FOREIGN KEY ( organizer_nip )
        REFERENCES organizer ( nip );
