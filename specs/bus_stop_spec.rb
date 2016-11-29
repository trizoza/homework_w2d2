require ('minitest/autorun')
require_relative ('../bus_stop')
require_relative ('../person')

class BusStopTest < MiniTest::Test

  def test_bus_stop_name
    bus_stop = BusStop.new("Easter Road")
    assert_equal("Easter Road", bus_stop.name)
  end 

  def test_adding_person_to_queue
    bus_stop = BusStop.new("Easter Road")
    passenger = Person.new("Bob", 90)

    bus_stop.add_person_to_queue(passenger)
    waiting_people = bus_stop.length_of_queue()

    assert_equal(1, waiting_people)
  end

  def test_empty_queue
    bus_stop = BusStop.new("Easter Road")
    passenger1 = Person.new("Bob", 90)
    passenger2 = Person.new("John", 80)

    bus_stop.add_person_to_queue(passenger1)
    bus_stop.add_person_to_queue(passenger2)
    bus_stop.empty_queue
    people_left = bus_stop.length_of_queue()

    assert_equal(0, people_left)
  end

end