class AddPaymentsSumFunction < ActiveRecord::Migration[6.0]
  def up
    execute(
      <<~SQL
        CREATE OR REPLACE FUNCTION payments_sum(VARCHAR)
        RETURNS NUMERIC AS $$
        DECLARE sum NUMERIC;
        BEGIN
          SELECT SUM(amount) INTO sum
          FROM participants JOIN participations ON participants.pesel = participations.participant_pesel
          JOIN payments ON participations.participant_pesel = payments.participant_pesel
          WHERE participants.pesel = $1
          GROUP BY participants.pesel;
          RETURN sum;
        END;
        $$ LANGUAGE PLPGSQL;
      SQL
    )
  end

  def down
    execute('DROP FUNCTION payments_sum')
  end
end
