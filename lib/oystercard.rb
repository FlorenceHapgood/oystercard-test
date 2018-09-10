class Oystercard
    attr_reader :balance

    def initialize(balance = 0)
        @balance = balance
        @CAPACITY = 90
    end

    def top_up(balance)
        raise "You cannot top up over £#{@CAPACITY}" if @balance >= @CAPACITY
        @balance += balance
    end
end