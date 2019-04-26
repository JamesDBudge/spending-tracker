require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../tag.rb')
require_relative('../merchant.rb')
require_relative('../transaction.rb')

class TestMerchant < MiniTest::Test

  def setup
    options = {"id" => "1", "name" => "ASDA"}
    @merchant = Merchant.new(options)
  end

  def test_merchant_name
    result = @merchant.name
    assert_equal("ASDA", result)
  end

  def test_merchant_id
    result = @merchant.id
    assert_equal(1, result)
  end

end
