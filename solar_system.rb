class System
  attr_reader :bodies, :name

  def initialize(name)
    @name = name
    @@bodies = []
  end

  def add(name, mass)
    @@bodies << name
  end
end

# VALUES FROM https://nssdc.gsfc.nasa.gov/planetary/factsheet/

class Body < System
attr_reader :body, :name, :mass
  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end


class Planet < Body
attr_reader :mass

  def initialize(name, mass)
    super(name, mass)
  end

  def day(hours)
    one_day = hours
    "#{@name}/'s day is #{one_day} hours long."
  end

  def year(days) #earth days
    orbital_period = days
    "One year on #{@name} is equal to #{orbital_period} here on earth.ob"
  end
end

class Star < Body
attr_reader :body, :type

  def initialize(name, mass)
    super(name, mass)
    @type = type

  end

  def type(name, mass, type)
    "#{@name} has a relative mass of #{@mass}, and is a #{@type} star."
  end
      # 0.08 - 0.5 - red M
      # 0.5 - 0.8 - orange K
      # 0.8 -1.05 - yellow-white - G
      # 1.05 - 2  - white F
      # 2-4  - blue-white A
      # 4-20 - bluish  B
      # 20-100 - bluest O
end

class Moon < Body
  attr_reader :body
  def initialize(name, mass)
    super(name, mass)
  end

  def month(days)
    orbit = days
    "#{orbit}"
  end
end

mw_galaxy = System.new("Milky Way Galaxy")
mercury = Planet.new("Mercury", 0.330)
venus = Planet.new('Venus', 4.87)
sun = Star.new("The Sun", 1.0, "G-type")

mercury.add("Mercury", 0.330)
venus.add("Venus", 4.87)
sun.add("The Sun", 1.0)

puts venus.day(2802)
puts mercury.year(88)
puts sun.type("The Sun", 1.0, "G-type")
