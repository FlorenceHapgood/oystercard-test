class Oystercard
    attr_reader :balance, :entry_station, :exit_station, :journey_log

    def initialize(balance = 0, journey_log = [])
        @balance = balance
        @CAPACITY = 90
        @MINIMUM = 1
        @entry_station = nil
        @journey_log = []
        @exit_station = nil

    end

    def top_up(amount)
        raise "You cannot top up over £#{@CAPACITY}" if @balance >= @CAPACITY
        @balance += amount
    end

    def deduct(fare)
        @balance -= fare
    end

    def in_journey?
        entry_station != nil
    end

    def touch_in(entry_station)
        raise "You're not passing with THAT balance" if @balance <= @MINIMUM
        @entry_station = entry_station
    end

    def touch_out(exit_station)
        @exit_station = exit_station
        @journey_log << {entry: entry_station, exit: exit_station}
        deduct(1)
        @entry_station = nil
    end
end
