require ('minitest/autorun')
require_relative ('../person')

class PersonTest < MiniTest::Test

  def test_name_of_person
    person = Person.new("Peter", 28)
    assert_equal("Peter", person.name())
  end

  def test_age_of_person
    person = Person.new("Andy", 24)
    assert_equal(24, person.age())
  end

  


end