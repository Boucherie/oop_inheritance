class System
  attr_reader :bodies

  def initialize(name)
    @name = name
    @bodies = []
  end

  def add(name, mass)
    bodies << name
  end
end

# VALUES FROM https://nssdc.gsfc.nasa.gov/planetary/factsheet/

class Body < System
attr_reader :body
  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end


class Planet < Body
attr_reader :name, :mass

  def initialize(name, mass)
    super(name, mass)
  end

  def day(hours)
    one_day = hours
  end

  def year(days) #earth days
    orbital_period = days
  end
end

class Star < Body
attr_reader :body

  def initialize(name, mass)
    super(name, mass)
  end

  def type(mass)
    if mass > 0.08 && mass <= 0.5
      "Red M-type star"
    elsif mass > 0.5 && mass <= 0.8
      "Orange K-type star"
    elsif mass > 0.5 && mass <= 1.05
      "Yellow-white G-type star"
    elsif mass > 1.05 && mass <= 2.0
      "White F-type star"
    elsif mass > 2.0 && mass <= 4.0
      "blue-white A-type star"
    elsif mass > 4.0 && mass <= 100
      "Bluish B-type star"
    else
      "Solar mass not applicable"
    end
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

mw_galaxy = System.new("Milky Way Galaxy")
mercury = Body.new("Mercury", 0.330)
venus = Body.new('Venus', 4.87)

mercury.add("Mercury", 0.330)
venus.add('Venus', 4.87)
