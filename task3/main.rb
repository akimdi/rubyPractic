require 'pg'
require 'uri'

# input_string = gets(chomp: true)

def add(name_t, options_t, options_v)
  sql_query = "INSERT INTO #{name_t}(#{options_t}) VALUES(#{options_v});"
  connection.exec(sql_query)
end

def select(table_name)
  sql_query = "SELECT * FROM #{table_name};"
  res = connection.exec(sql_query)
  res.each do |row|
    puts row['id'] + ' | ' + row['type'] + ' | ' + row['breed']
  end
end

def update(name_t, options_t, values_t, values_w)
  sql_query = "UPDATE #{name_t} SET #{options_t} = '#{values_t}' WHERE #{options_t} = '#{values_w}';"
  connection.exec(sql_query)
end

def delete(name_t, options_w, values_w)
  sql_query = "DELETE FROM #{name_t} WHERE #{options_w} = '#{values_w}';"
  connection.exec(sql_query)
end

def connection
  PGconn.connect('localhost', 5432, '', '', 'akimdb', 'akim', '1234pass')
end

# examples
select('dogs')
add('dog','type', "'doggi'")
update('dog', 'type', 'Mops', 'Petty')
delete('dog', 'type', 'doggi')