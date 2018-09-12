class Station

attr_reader :zone, :name

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  def display_zone
    zone
  end
end
