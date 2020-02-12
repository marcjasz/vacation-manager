class InitSchema < ActiveRecord::Migration[6.0]
  def change
    execute(
      <<~SQL
        CREATE TABLE counselors (
          pesel          VARCHAR(11) NOT NULL,
          name           VARCHAR(20) NOT NULL,
          surname        VARCHAR(40) NOT NULL,
          address        VARCHAR(50) NOT NULL,
          phone_number   VARCHAR(12) NOT NULL
        );

        ALTER TABLE counselors ADD CONSTRAINT counselors_pk PRIMARY KEY ( pesel );

        CREATE TABLE "groups" (
          id              SERIAL PRIMARY KEY,
          vacation_name   VARCHAR(50) NOT NULL);

        CREATE TABLE group_supervision (
          counselor_pesel   VARCHAR(11) NOT NULL,
          group_id          INTEGER NOT NULL
        );

        ALTER TABLE group_supervision ADD CONSTRAINT group_supervision_pk PRIMARY KEY ( counselor_pesel,
                                                                                      group_id );

        CREATE TABLE hostings (
          group_id       INTEGER NOT NULL,
          lodging_name   VARCHAR(50) NOT NULL
        );

        ALTER TABLE hostings ADD CONSTRAINT hostings_pk PRIMARY KEY ( group_id,
                                                                  lodging_name );

        CREATE TABLE invoices (
          invoice_number         SERIAL PRIMARY KEY,
          "date"                 DATE NOT NULL,
          amount                 NUMERIC(12, 2) NOT NULL,
          service_provider_nip   VARCHAR(10) NOT NULL,
          organizer_nip          VARCHAR(10) NOT NULL,
          vacation_name          VARCHAR(50) NOT NULL,
          service                VARCHAR(100) NOT NULL
        );

        ALTER TABLE invoices ADD CONSTRAINT invoice_amount_positive CHECK ( amount > 0 );

        CREATE TABLE lodgings (
          name           VARCHAR(50) NOT NULL,
          address        VARCHAR(50) NOT NULL,
          capacity       INTEGER NOT NULL,
          owner          VARCHAR(50) NOT NULL,
          phone_number   VARCHAR(12) NOT NULL,
          email          VARCHAR(40),
          company        VARCHAR(50) NOT NULL
        );

        ALTER TABLE lodgings ADD CONSTRAINT lodgings_pk PRIMARY KEY ( name );

        CREATE TABLE organizers (
          nip            VARCHAR(10) NOT NULL,
          name           VARCHAR(50) NOT NULL,
          address        VARCHAR(50) NOT NULL,
          phone_number   VARCHAR(12) NOT NULL,
          email          VARCHAR(40)
        );

        ALTER TABLE organizers ADD CONSTRAINT organizers_pk PRIMARY KEY ( nip );

        CREATE TABLE participants (
          pesel          VARCHAR(11) NOT NULL,
          name           VARCHAR(20) NOT NULL,
          surname        VARCHAR(40) NOT NULL,
          school         VARCHAR(100),
          phone_number   VARCHAR(12) NOT NULL
        );

        ALTER TABLE participants ADD CONSTRAINT participants_pk PRIMARY KEY ( pesel );

        CREATE TABLE participations (
          participant_pesel   VARCHAR(11) NOT NULL,
          group_id            INTEGER NOT NULL
        );

        ALTER TABLE participations ADD CONSTRAINT participations_pk PRIMARY KEY ( participant_pesel,
                                                                              group_id );

        CREATE TABLE payments (
          id                  SERIAL PRIMARY KEY,
          amount              NUMERIC(12, 2) NOT NULL,
          "date"              DATE NOT NULL,
          participant_pesel   VARCHAR(11) NOT NULL,
          group_id            INTEGER NOT NULL
        );

        ALTER TABLE payments ADD CONSTRAINT payment_amount_positive CHECK ( amount > 0 );

        CREATE TABLE service_providers (
          nip            VARCHAR(10) NOT NULL,
          address        VARCHAR(50) NOT NULL,
          name           VARCHAR(50) NOT NULL,
          phone_number   VARCHAR(12) NOT NULL,
          email          VARCHAR(40) NOT NULL
        );

        ALTER TABLE service_providers ADD CONSTRAINT service_providers_pk PRIMARY KEY ( nip );

        CREATE TABLE vacations (
          name            VARCHAR(50) NOT NULL,
          organizer_nip   VARCHAR(10) NOT NULL,
          start_date      DATE NOT NULL,
          end_date        DATE NOT NULL
        );

        ALTER TABLE vacations ADD CONSTRAINT vacation_date_order CHECK ( start_date <= end_date );

        ALTER TABLE vacations ADD CONSTRAINT vacations_pk PRIMARY KEY ( name );

        ALTER TABLE group_supervision
          ADD CONSTRAINT group_supervision_counselors_fk FOREIGN KEY ( counselor_pesel )
              REFERENCES counselors ( pesel ) ON DELETE CASCADE;

        ALTER TABLE group_supervision
          ADD CONSTRAINT group_supervision_group_fk FOREIGN KEY ( group_id )
              REFERENCES "groups" ( id ) ON DELETE CASCADE;

        ALTER TABLE "groups"
          ADD CONSTRAINT groups_vacations_fk FOREIGN KEY ( vacation_name )
              REFERENCES vacations ( name );

        ALTER TABLE hostings
          ADD CONSTRAINT hostings_groups_fk FOREIGN KEY ( group_id )
              REFERENCES "groups" ( id ) ON DELETE CASCADE;

        ALTER TABLE hostings
          ADD CONSTRAINT hostings_lodgings_fk FOREIGN KEY ( lodging_name )
              REFERENCES lodgings ( name ) ON DELETE CASCADE;

        ALTER TABLE invoices
          ADD CONSTRAINT invoices_organizers_fk FOREIGN KEY ( organizer_nip )
              REFERENCES organizers ( nip );

        ALTER TABLE invoices
          ADD CONSTRAINT invoices_service_providers_fk FOREIGN KEY ( service_provider_nip )
              REFERENCES service_providers ( nip );

        ALTER TABLE invoices
          ADD CONSTRAINT invoices_vacations_fk FOREIGN KEY ( vacation_name )
              REFERENCES vacations ( name );

        ALTER TABLE participations
          ADD CONSTRAINT participations_group_fk FOREIGN KEY ( group_id )
              REFERENCES "groups" ( id ) ON DELETE CASCADE;

        ALTER TABLE participations
          ADD CONSTRAINT participations_participants_fk FOREIGN KEY ( participant_pesel )
              REFERENCES participants ( pesel ) ON DELETE CASCADE;

        ALTER TABLE payments
          ADD CONSTRAINT payments_participations_fk FOREIGN KEY ( participant_pesel,
                                                                group_id )
              REFERENCES participations ( participant_pesel,
                                        group_id );

        ALTER TABLE vacations
          ADD CONSTRAINT vacations_organizers_fk FOREIGN KEY ( organizer_nip )
            REFERENCES organizers ( nip );
      SQL
    )
  end
end
