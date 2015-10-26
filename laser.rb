require_relative "zorder"

class Laser
	attr_reader :x, :y

	def initialize
		@x = x
		@y = y
		@laser_width = 2
		@laser_length = 700
		@color = 0xffd936f1
	end

	# def update
	# 	@y -= @speed
	# 	@x -= @speed
	# end

def draw
	@image.draw(@laser_width, @laser_length, @color, ZORder::Laser)
end

end


