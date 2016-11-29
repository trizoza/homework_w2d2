class BusStop

  attr_reader :name
  attr_accessor :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def length_of_queue()
    return @queue.length()
  end

  def add_person_to_queue(person)
    @queue.push(person)
  end

  def empty_queue()
    n = length_of_queue()
    n.times { @queue.pop() }
  end

end