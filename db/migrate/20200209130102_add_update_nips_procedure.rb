class AddUpdateNipsProcedure < ActiveRecord::Migration[6.0]
  def up
    execute(
    <<~SQL
      CREATE PROCEDURE update_nips(INT)
      LANGUAGE PLPGSQL
      AS $$ DECLARE
        org_nip VARCHAR;
        sp_nip VARCHAR;
      BEGIN
        SELECT organizers.nip, sp.nip INTO org_nip, sp_nip
        FROM invoices
          JOIN vacations
            ON vacations.id = invoices.vacation_id
          JOIN organizers
            ON organizers.id = vacations.organizer_id
          JOIN service_providers sp
            ON sp.id = invoices.service_provider_id
        WHERE invoices.id = $1;

        UPDATE invoices
        SET organizer_nip = org_nip,
            service_provider_nip = sp_nip
        WHERE id = $1;
      END;
      $$;
    SQL
    )
  end

  def down
    execute("DROP PROCEDURE update_nips")
  end
end
