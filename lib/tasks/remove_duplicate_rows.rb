require 'rubygems'
require 'mysql'
require 'sqlite3'

class DuplicateRemover
    #(done)get collection of dealer names that appear more than once
    #(done)issue select based on those names,
    #(done)ignore result from 1st iteration, 
    #(done)store id's from the remaining iteration - they represent duplicated rows
    #use Dealer.delete([]) to remove array of id's
  def initialize
    @mysql = Mysql::new('localhost','root','','omni_dev')
    @sqlite = SQLite3::Database.open('.\..\..\db\development.db')
    @table = 'dealers'
    @must_delete = []
    @must_delete_id = []
  end

  def output_duplicate_dealer_names
    @sqlite.execute("select * from #{@table}") do |row|
      query = "select * from #{@table} where name='#{row[1]}'"
      result = @mysql.query(query)
      #puts "#{query} - #{result.num_rows}"
      if result.num_rows > 1
        # create an array of dealer names that have duplicate rows in database
        @must_delete << row[1]
      end
    end
    @must_delete.uniq!
    puts @must_delete
  end
  # outputs the id's that need to be removed from omni_dev
  def output_must_delete_id
    File.open('duplicate.txt') do |f|
      f.each_line do |line|
        is_first_result = true
        name = line.strip
        @sqlite.execute("select * from #{@table} where name='#{name}'") do |row|
          if is_first_result 
            is_first_result = false
          else
            @must_delete_id << row[0]
          end
        end
      end
    end
    puts @must_delete_id
  end

  def delete_duplicate_id
    File.open('duplicate_id.txt') do |f|
      f.each_line do |line|
        id = line.strip
        #@sqlite.execute("delete from #{@table} where id=#{id}")
        @mysql.query("delete from #{@table} where id=#{id}")
      end
    end
  end

  def sort_must_delete_id
    s = []
    File.open('duplicate_id.txt') do |f|
      f.each_line do |line|
        s << line
      end
    end
    print s.sort
  end
end
    

dr = DuplicateRemover.new
dr.output_duplicate_dealer_names

