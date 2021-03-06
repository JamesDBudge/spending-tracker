require('pry-byebug')

require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./merchant.rb')

require('pry-byebug')

class Transaction

  attr_reader :merchant_id, :tag_id, :id, :spent, :transaction_time, :name, :tag

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @spent = options['spent'].to_f.round(2)
    @name = options['name'] if options['name']
    @tag = options['tag'] if options['tag']
    @transaction_time = options['transaction_time'] if options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, spent, transaction_time) VALUES ($1, $2, $3, NOW()) RETURNING id, transaction_time"
    values = [@merchant_id, @tag_id, @spent]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    @transaction_time = results.first()['transaction_time']
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

  def self.destroy(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT transactions.id, transactions.tag_id, transactions.merchant_id, transactions.spent, transactions.transaction_time, merchants.name, tags.tag
    FROM transactions
    INNER JOIN tags
    ON transactions.tag_id = tags.id
    INNER JOIN merchants
    ON transactions.merchant_id = merchants.id
    WHERE transactions.id = $1"
    values = [id]
    transaction = SqlRunner.run( sql, values )
    result = Transaction.new( transaction.first )
    return result
  end

  def self.find_by_value(uniq_id, value_name)
    sql = "SELECT transactions.id, merchants.name, transactions.spent, tags.tag, transactions.tag_id, transactions.merchant_id, transactions.transaction_time
    FROM transactions
    INNER JOIN tags
    ON transactions.tag_id = tags.id
    INNER JOIN merchants
    ON transactions.merchant_id = merchants.id
    WHERE #{value_name} = $1
    ORDER BY transactions.transaction_time ASC"
    values = [uniq_id]
    transactions = SqlRunner.run(sql, values)
    results = transactions.map { |transaction| Transaction.new(transaction)  }
    return results
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

  def self.all_transactions_pretty()
    sql = "SELECT transactions.id, merchants.name, transactions.spent, tags.tag, transactions.tag_id, transactions.merchant_id, transactions.transaction_time
    FROM transactions
    INNER JOIN tags
    ON transactions.tag_id = tags.id
    INNER JOIN merchants
    ON transactions.merchant_id = merchants.id
    ORDER BY transactions.transaction_time ASC"
    pretty_transactions = SqlRunner.run(sql)
    result = pretty_transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end


end
