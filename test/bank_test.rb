gem 'minitest', '~> 5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bank'
require_relative '../lib/credit_check'

class BankTest < Minitest::Test
  def test_it_exists
    bank = Bank.new("Wells Fargo")
    assert_instance_of Bank, bank
  end

  def test_it_has_a_name
    bank = Bank.new("Wells Fargo")
    assert_equal "Wells Fargo", bank.name
  end

  def test_it_knows_a_transaction_is_invalid_when_credit_card_is_invalid
    bank = Bank.new("Wells Fargo")
    credit_card = CreditCard.new("342801633855673", 15000)
    assert_equal false, bank.valid_transaction?(100, credit_card)
  end

  def test_it_knows_a_transactions_is_invalid_when_the_amount_is_over_the_limit
    bank = Bank.new("Wells Fargo")
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal false, bank.valid_transaction?(20000, credit_card)
  end

  def test_it_knows_when_a_transaction_is_valid
    bank = Bank.new("Wells Fargo")
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal true, bank.valid_transaction?(11000, credit_card)
  end

  def test_it_knows_card_number
    bank = Bank.new("Chase")
    credit_card = CreditCard.new("342804633855673")
    assert_equal "342804633855673", credit_card.card_number
  end

  def test_if_card_number_is_valid
    bank = Bank.new("Chase")
    credit_card = CreditCard.new("5541808923795240")
    assert credit_card.is_valid?
  end

  def test_if_card_number_is_invalid
    bank = Bank.new("Chase")
    credit_card = CreditCard.new("4024007106512380")
    refute credit_card.is_valid?
  end

  def test_it_can_give_last_four
    bank = Bank.new("Chase")
    credit_card = CreditCard.new("342804633855673")
    assert_equal "5673", credit_card.last_four
  end
end

