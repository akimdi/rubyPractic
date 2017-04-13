o = File.new("out.txt","w")
File.open("mddrive.xml") { |f1|
  while get = f1.gets
    temp = get.split(' ')
    if temp[0] == '<template'
      st = temp[1].split('"')
      o.puts(st[1])
    end
  end
}
o.close
