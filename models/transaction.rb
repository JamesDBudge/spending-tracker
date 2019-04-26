require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./merchant.rb')

class Transaction

  attr_reader :merchant_id, :tag_id, :id, :spent

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @spent = options['spent']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, spent) VALUES ($1, $2, $3) RETURNING id"
    values = [@merchant_id, @tag_id, @spent]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      merchant_id,
      tag_id,
      spent
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@merchant_id, @tag_id, @spent, @id]
      SqlRunner.run( sql, values )
    end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run( sql, values )
    result = Transaction.new( transaction.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end


end
