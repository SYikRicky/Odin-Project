class MyCar
  attr_accessor :brand, :year
  def initialize(brand, year)
    self.brand = brand
    self.year = year
  end
  
  def gas_mileage(miles, gallon)
    puts "The car has #{miles/gallon} gas milleage."
  end

  def to_s
    "The car is #{brand} in #{year}."
  end
end

my_lambo = MyCar.new("lambo", 2023)
my_lambo.gas_mileage(100,2)
puts my_lambo