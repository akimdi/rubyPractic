require 'pg'
# 'gets' akim & akimdb
conn = PGconn.connect('localhost', 5432, '', '', 'akimdb', 'akim', '4576akimpass')
res = conn.exec('SELECT * FROM akimdb.public.dogs;')
res.each do |row|
  puts row['id'] + ' | ' + row['type']
end