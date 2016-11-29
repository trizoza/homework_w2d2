require ('minitest/autorun')
require_relative ('../bus')
require_relative ('../person')
require_relative ('../bus_stop')

class BusTest < MiniTest::Test

  def test_bus_route_number
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    assert_equal(35, bus.route_number)
  end

  def test_bus_destination
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    assert_equal("Airport", bus.destination)
  end

  def test_bus_drive_method
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    assert_equal("vrrrrrrrrm", bus.drive_method)
  end

  def test_how_many_passengers_are_on_board
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    passengers_on_board = bus.passengers_count()
    assert_equal(0, passengers_on_board)
  end

  def test_passenger_pick_up
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    passenger = Person.new("Peter", 28)

    bus.pick_up(passenger)
    passengers_on_board = bus.passengers_count()

    assert_equal(1, passengers_on_board)
  end

  def test_passenger_drop_off
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    passenger = Person.new("Peter", 28)

    bus.pick_up(passenger)
    bus.drop_off(passenger)
    passengers_on_board = bus.passengers_count()

    assert_equal(0, passengers_on_board)
  end

  def test_empty_bus
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    passenger1 = Person.new("Peter", 28)
    passenger2 = Person.new("Andy", 24)
    passenger3 = Person.new("Bob", 90)

    bus.pick_up(passenger1)
    bus.pick_up(passenger2)
    bus.pick_up(passenger3)
    bus.empty_bus
    passengers_on_board = bus.passengers_count()

    assert_equal(0, passengers_on_board)
  end

  def test_pick_up_everyone
    bus = Bus.new(35, "Airport", "vrrrrrrrrm")
    passenger1 = Person.new("Peter", 28)
    passenger2 = Person.new("Andy", 24)
    passenger3 = Person.new("Bob", 90)
    bus_stop = BusStop.new("Airport")

    bus_stop.add_person_to_queue(passenger1)
    bus_stop.add_person_to_queue(passenger2)
    bus_stop.add_person_to_queue(passenger3)
    
    bus.pick_up_everyone(bus_stop)
    
    people_taken = bus.passengers_count()
    people_left = bus_stop.length_of_queue()

    assert_equal(3, people_taken)
    assert_equal(0, people_left)
  end


end