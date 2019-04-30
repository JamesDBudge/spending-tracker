require_relative('../db/sql_runner.rb')

class Budget
  attr_reader :id, :amount

  def initialize(options)
    @id = options['id'] if options['id']
    @amount = options['amount']
  end

  def save
    sql = "INSERT INTO moneys (amount) VALUES ($1) RETURNING id;"
    values = [@amount]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE moneys SET amount = $1 where id = $2"
    values = [@amount, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM moneys"
    moneys = SqlRunner.run(sql)
    result = moneys.map { |amount| Budget.new(amount)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM moneys"
    SqlRunner.run(sql)
  end


end
