class Oystercard
    attr_reader :balance

    def initialize(balance = 0)
        @balance = balance
    end

    def balance(balance)
        balance
    end
end