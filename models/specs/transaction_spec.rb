require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../tag.rb')
require_relative('../merchant.rb')
require_relative('../transaction.rb')

class TestTransaction < MiniTest::Test

  def setup
    options = {"id" => "1", "tag_id" => "2", "merchant_id" => "4", "spent" => "35"}
    @transaction = Transaction.new(options)
  end

  def test_transaction_spent
    result = @transaction.spent.to_i
    assert_equal(35, result)
  end

  def test_tag_id
    result = @transaction.tag_id.to_i
    assert_equal(2, result)
  end

  def test_merchant_id
    result = @transaction.merchant_id.to_i
    assert_equal(4, result)
  end

  def test_transaction_id
    result = @transaction.id
    assert_equal(1, result)
  end

end
