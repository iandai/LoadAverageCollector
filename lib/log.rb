require "sqlite3"

class Log

  def initialize
    @db = SQLite3::Database.new "log/average_load.db"  
    setup_table(@db) if !table_exist?(@db, "logs")
  end
  
  def insert(row) 
    time = Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s
    @db.execute "insert into logs values ( ?, ?, ?, ? )", time, row[:la1min], row[:la5min], row[:la15min]    
  end
  
  def find_all
    @db.execute( "SELECT * from logs;" )
  end
  
  
  private
  def setup_table(db)
    db.execute <<-SQL
      create table logs (
        timestamp text not null,
        la1min real,
        la5min real,
        la15min real
      );
    SQL
  end
  
  def table_exist?(db, table)
    count = db.execute( "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='#{table}';" )
    
    if count[0][0] == 0
      return false
    else
      return true
    end
  end
  
end