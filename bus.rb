require_relative ('bus_stop')

class Bus

  attr_reader :route_number, :destination, :drive_method

  def initialize(route_number, destination, drive_method)
    @route_number = route_number
    @destination = destination
    @drive_method = drive_method
    @passengers = []
  end

  def passengers_count()
    return @passengers.count()
  end

  def pick_up(passenger)
    return @passengers.push(passenger)
  end

  def drop_off(passenger)
    return @passengers.delete(passenger)
  end

  def empty_bus()
    n = passengers_count()
    n.times { @passengers.pop() }
  end

  def pick_up_everyone(bus_stop)
    
    if bus_stop.name() == @destination  
      @passengers << bus_stop.queue()
      @passengers.flatten!()
      bus_stop.empty_queue()
    end

  end

end