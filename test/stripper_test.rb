require 'test/unit'

require 'rubygems'
require 'active_record'

require File.join(File.dirname(__FILE__), '..', 'lib', 'stripper')

ActiveRecord::Base.establish_connection({
  'database' => ':memory:',
  'adapter' => 'sqlite3',
  'timeout' => 500
})

ActiveRecord::Schema.define do
  create_table "users", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "id"
  end
end

class User < ActiveRecord::Base
end

class StripperTest < Test::Unit::TestCase
  def test_stripper_prunes_leading_and_trailing_whitespace
    user = User.create!(:first_name => ' Gilbert ')
    assert_equal 'Gilbert', user.first_name
  end

  def test_stripper_converts_empty_strings_to_nil
    user = User.create!(:first_name => ' ')
    assert_nil user.first_name
  end
end