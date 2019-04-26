require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../tag.rb')
require_relative('../merchant.rb')
require_relative('../transaction.rb')

class TestTag < MiniTest::Test

  def setup
    options = {"id" => "1", "tag" => "groceries"}
    @tag = Tag.new(options)
  end

  def test_tag_text
    result = @tag.tag
    assert_equal("groceries", result)
  end

  def test_tag_id
    result = @tag.id
    assert_equal(1, result)
  end

  def test_destroy
    result = Tag.destroy(10)
    assert_equal(nil, result.first)
  end


end
