require "sqlite3"

class Log
    
  def self.insert(row) 
    db = SQLite3::Database.new "log/average_load.db"  
    setup_table(db) if !table_exist?(db, "logs")
    
    time = Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s
    db.execute "insert into logs values ( ?, ?, ?, ? )", time, row[:la1min], row[:la5min], row[:la15min]    
  end
  
  def self.find_all
    db = SQLite3::Database.new "log/average_load.db"
    db.execute( "SELECT * from logs;" )
  end
  
  
  private
  def self.setup_table(db)
    db.execute <<-SQL
      create table logs (
        timestamp text not null,
        la1min real,
        la5min real,
        la15min real
      );
    SQL
  end
  
  def self.table_exist?(db, table)
    count = db.execute( "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='#{table}';" )
    
    if count[0][0] == 0
      return false
    else
      return true
    end
  end
  
end

