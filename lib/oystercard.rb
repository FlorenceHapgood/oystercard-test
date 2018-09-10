class Oystercard
    attr_reader :balance, :journey

    def initialize(balance = 0)
        @balance = balance
        @CAPACITY = 90
        @MINIMUM = 1
        @journey = false 
    end

    def top_up(balance)
        raise "You cannot top up over £#{@CAPACITY}" if @balance >= @CAPACITY
        @balance += balance
    end

    def deduct(fare)
        @balance -= fare
    end

    def in_journey?
        @journey
    end

    def touch_in
        raise "You're not passing with THAT balance" if @balance <= @MINIMUM
        @journey = true
    end

    def touch_out
        @journey = false
    end
end

# card = Oystercard.new -> card.top_up(10) -> card.in_journey? #false
# -> card.touch_in -> card.in_journey?