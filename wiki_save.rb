# https://github.com/kenpratt/wikipedia-client
# gem install wikipedia-client
require 'wikipedia'

Wikipedia.configure {
  domain 'zh-min-nan.wikipedia.org'
  path   'w/api.php'
}

File.open('index_720.txt', 'r').each_line do |line|
  begin
    data = line.chomp.split(/:/)
    name = data[0..1]
    page = Wikipedia.find(name)
    File.open('data/' + name.join('__') + '.txt', 'w') {|f| f.write(page.summary) }
    sleep 0.1
  rescue
  end
end
