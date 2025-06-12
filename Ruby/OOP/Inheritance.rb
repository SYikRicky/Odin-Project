# --- Vehicle Problems --- #
module Appreciatable
  def girl_love
    puts "Girl will love this car."
  end
end

class Vehicle
  attr_accessor :year, :model
  @@number_of_vehicle = 0

  def initialize(year, model)
    self.year = year
    self.model = model
    @@number_of_vehicle += 1
  end

  def self.get_num_of_vehicle
    puts "There are #{@@number_of_vehicle} vehicles in my house."
  end
  
  def info
    puts "(From Vehicle) Hello. "  
  end
end

class MyCar < Vehicle
  include Appreciatable
  WINDOWS_NUM = 2

  def info
    super
    puts "This is my car #{model}."
  end
end

class MyTruck < Vehicle
  WINDOWS_NUM = 4

  def info
    super
    puts "This is my truck #{model}."
    puts "It has #{age} years old."
  end

  private
  def age
    Time.now.year - self.year
  end
end

truck_1 = MyTruck.new(2010, "toyota")
car_1 = MyCar.new(2022, "lambogini")

puts "---Truck---"
truck_1.info

puts "---Car---"
car_1.info
car_1.girl_love

puts "---Overview---"
Vehicle.get_num_of_vehicle

# ---- Student Problems --- #
class Student
  attr_accessor :name
  
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  protected
  def grade
    @grade
  end
  

end