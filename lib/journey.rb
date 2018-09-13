class Journey
attr_reader :entry_station, :exit_station #:fare_paid

  def initialize
    @entry_station = nil
    @exit_station = nil
    #@fare_paid = nil
  end

  def start(start_station)
    @entry_station = start_station

  end

  def finish(end_station)
     @exit_station = end_station
  end

  def fare
    complete? ? 1 : 6
    # return 1 if complete? == true
    # return 6 if complete? == false
  end

  def complete?
     @entry_station && @exit_station != nil
  end

end
