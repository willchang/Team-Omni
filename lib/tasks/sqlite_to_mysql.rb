require 'rubygems'
require 'mysql'
require 'sqlite3'

  def s(word)
      correct = word.gsub("'","''")
      return correct
  end

  def transfer(table)
    mysql = Mysql::new('localhost','root','','omni_dev')
    sqlite = SQLite3::Database.open('.\..\..\db\development.db')
    sqlite.execute("select * from #{table}") do |row|
      col = row.length
      i = 0
      s = []
      while i < col
        s << "'#{row[i]}'"
        i += 1
      end
      query = "insert into #{table} values(#{s.join(",")})"
      mysql.query(query)
    end
  end


  transfer('dealers')
  transfer('cars')
  transfer('comments')
  transfer('makes')
  transfer('posts')
  transfer('users')

