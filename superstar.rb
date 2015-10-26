require_relative "star"

class SuperStar < Star

	def initilialize(animation)
		super(animation)
		self.zoomLevel = 4
		c = Gosu::Color.new(0xff_000000)
		c.red = 256
		c.green = 0
		c.blue = 0
		self.color = c
	end

end


	


# add to main
# ======================
# s = Star.new(...)

# t = SuperStar.new(...)

# list = []

# list.push(s)
# list.push(t)
# ==================================
require_relative "superstar"
