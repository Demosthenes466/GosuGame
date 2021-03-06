require_relative "zorder"
class Star
	attr_reader :x, :y
	attr_accessor :zoomLevel, :color

	def initialize(animation)
		@animation = animation
		@color = Gosu::Color.new(0xff_000000)
		@color.red = rand(256 - 40) + 40
		@color.green = rand(256 - 40) + 40
		@color.blue = rand(256 - 40) + 40
		@x = rand * 640
		@y = rand * 480
		@zoomLevel = 1
	end

	def draw
		img = @animation[Gosu::milliseconds / 100 % @animation.size];
		img.draw(@x - img.width / 4.0, @y - img.height / 4.0,
			ZOrder::Stars, zoomLevel, zoomLevel, @color, :add)
	end
end
