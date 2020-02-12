class AddInvoiceOrganizerTrigger < ActiveRecord::Migration[6.0]
  def up
    execute(
      <<~SQL
        CREATE OR REPLACE FUNCTION update_invoice_organizer() RETURNS TRIGGER AS $$
        DECLARE
          org_nip integer;
        BEGIN
          SELECT nip INTO NEW.organizer_nip
          FROM organizers JOIN vacations ON organizers.nip = vacations.organizer_nip
          WHERE vacations.name = NEW.vacation_name;

          RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER update_invoice_organizer_trigger
          BEFORE INSERT OR UPDATE ON invoices
          FOR EACH ROW EXECUTE PROCEDURE update_invoice_organizer();
      SQL
    )
  end

  def down
    execute(
      <<~SQL
        DROP TRIGGER update_invoice_organizer_trigger ON invoices;
        DROP FUNCTION update_invoice_organizer;
      SQL
    )
  end
end
