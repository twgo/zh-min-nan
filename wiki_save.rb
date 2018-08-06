# https://github.com/kenpratt/wikipedia-client
# gem install wikipedia-client
require 'wikipedia'

Wikipedia.configure {
  domain 'zh-min-nan.wikipedia.org'
  path   'w/api.php'
}

resource = 'input/index_720.txt'
file_todo='input/index_720_todo.txt'

File.open(resource, 'r').each_line.with_index do |line, index|
  if (index < 400000) && (index > 300000)
    File.open(file_todo, "a+") do |f|
      f.puts("#{line}")
    end
  end
end

File.open(file_todo, 'r').each_line do |line|
  begin
    data = line.chomp.split(/:/)
    number = data[0..1]
    name = data[2..-1]
    page = Wikipedia.find(name)
    File.open('data/' + number.join('__') + '.txt', 'w') {|f| f.write(page.title+"\n"+page.text) }
  rescue
  end
end
