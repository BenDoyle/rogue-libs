require 'tty-prompt'
require 'sqlite3'
require 'test/unit'

Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each do |file|
  require file
end
