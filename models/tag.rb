require_relative('../db/sql_runner.rb')
require('pry')

class Tag

  attr_reader :tag, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag = options['tag'].capitalize
  end

  def save()
    sql = "INSERT INTO tags (tag) VALUES ($1) RETURNING id;"
    values = [@tag]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET tag = $1 WHERE id = $2"
    values = [@tag, @id]
    SqlRunner.run( sql, values )
  end

  def self.destroy(id)
    #binding.pry
    sql = "DELETE FROM transactions
    WHERE tag_id = $1;"
    values = [id]
    SqlRunner.run( sql, values )
    sql = "DELETE FROM tags WHERE id = $1"
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    tag = SqlRunner.run( sql, values )
    result = Tag.new( tag.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM tags ORDER BY tag ASC"
    tags = SqlRunner.run( sql )
    result = tags.map { |tag| Tag.new( tag ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end


end
