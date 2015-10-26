require_relative "zorder"
require_relative "player"
class BaseShot

  attr_reader :x, :y, :width, :height, :angle

	def initialize
		@image = Gosu::Image.new("laser.png")
		@x = x 
		@y = y 
		@width = 2
		@height = 10
		@color1 = Gosu::Color.new(0xffd936f1)
		@color2 = Gosu::Color.new(0xff000000)
	end

	# def warp
	# 	@x, @y = x, y
	# end
	def move
		@x -= 25
		@y -= 25 
	end 

	def update(x, y, angle)
		@angle = angle + 1000010
		@x = x 
		@y = y
	end

	def draw
		print "help"
		@image.draw_rot(@x, @y, ZOrder::Shot, @angle)
		print "Laser"
	end 
 
	

	

	
end
  
  # def fire
  #   play_sound
  # end
  
  # def play_sound
  #   @window.play_sound( @snd, @snd_frequency, @snd_volume )
  # end

