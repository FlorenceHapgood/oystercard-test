class Oystercard
    attr_reader :balance, :journey, :entry_station


    def initialize(balance = 0)
        @balance = balance
        @CAPACITY = 90
        @MINIMUM = 1
        @journey = false
        @entry_station = []
    end

    def top_up(amount)
        raise "You cannot top up over £#{@CAPACITY}" if @balance >= @CAPACITY
        @balance += amount
    end

    def deduct(fare)
        @balance -= fare
    end

    def in_journey?
      if @entry_station == nil
        @journey
      end
    end

    def touch_in(tube_station)
        raise "You're not passing with THAT balance" if @balance <= @MINIMUM
        @entry_station << tube_station
        @journey = true
    end

    def touch_out
        @journey = false
        @entry_station = nil
    end

end

# card = Oystercard.new -> card.top_up(10) -> card.in_journey? #false
# -> card.touch_in -> card.in_journey?
