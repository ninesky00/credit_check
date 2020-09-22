# Your Luhn Algorithm Here
def luhn_algorithm (credit_card)
    numbers = credit_card.chars.map(&:to_i)
    double = []
    numbers.each_with_index do |num, idx|
        if idx.even?
            if num*2 > 9
                double << num*2 -9
            else 
                double << num*2
            end
        else 
            double <<  num
        end     
    end
    total = double.reduce {|sum, num| sum += num}
    valid = total % 10 == 0
    return valid
end

class CreditCard
    attr_reader :card_number, :limit
    def initialize(card_number, limit=15000)
        @card_number = card_number
        @limit = limit
    end

    def is_valid?
        p luhn_algorithm(card_number)
    end

    def last_four
        "#{card_number[-4..-1]}"
    end
end
# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
