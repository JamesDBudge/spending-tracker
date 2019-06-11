require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd67ktaeup407o', host: 'ec2-23-21-186-85.compute-1.amazonaws.com', user: 'wiygqqlozzgbku'}, password: '09a973d041643c3dec22de6cd9b09e876b885f38d5f44615223f06b2d9c21b06')
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
