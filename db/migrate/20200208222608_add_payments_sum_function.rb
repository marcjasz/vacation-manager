class AddPaymentsSumFunction < ActiveRecord::Migration[6.0]
  def up
    execute(
    <<~SQL
      CREATE OR REPLACE FUNCTION payments_sum(INTEGER)
      RETURNS NUMERIC AS $$
      DECLARE sum NUMERIC;
      BEGIN
        SELECT SUM(amount) INTO sum
        FROM participants JOIN participations ON participants.id = participations.participant_id
        JOIN payments ON participations.id = payments.participation_id
        WHERE participants.id = $1
        GROUP BY participants.id;

        RETURN sum;
      END; $$ 
      LANGUAGE PLPGSQL;
    SQL
    )
  end

  def down
    execute("DROP FUNCTION payments_sum")
  end
end
