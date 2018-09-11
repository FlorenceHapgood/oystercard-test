class Oystercard
    attr_reader :balance, :journey, :entry_station, :station_log, :exit_station


    def initialize(balance = 0)
        @balance = balance
        @CAPACITY = 90
        @MINIMUM = 1
        @journey = false
        @entry_station
        @station_log = []
        @exit_station
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
        return false
      else
        return true
      end
    end

    def touch_in(tube_station)
        raise "You're not passing with THAT balance" if @balance <= @MINIMUM
        @entry_station = tube_station
        @station_log << tube_station
        @journey = true
    end

    def touch_out(exit_station)

        @entry_station = nil
        @exit_station = exit_station
        @station_log << @exit_station
        @journey = false
    end

end

# card = Oystercard.new -> card.top_up(10) -> card.in_journey? #false
# -> card.touch_in -> card.in_journey?
