# https://github.com/kenpratt/wikipedia-client
# gem install wikipedia-client
require 'wikipedia'

resource = 'input/index_260000.txt'

Wikipedia.configure {
  domain 'zh-min-nan.wikipedia.org'
  path   'w/api.php'
}

File.open(resource, 'r').each_line do |line|
  begin
    data = line.chomp.split(/:/)
    number = data[0..1]
    name = data[2..-1]
    page = Wikipedia.find(name)
    File.open('data/' + number.join('__') + '.txt', 'w') {|f| f.write(page.title+"\n"+page.text) }
  rescue
  end
end
