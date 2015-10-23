require_relative "zorder"
class Bomb
	attr_reader :x, :y

	def initialize
		@image = Gosu::Image.new("bomb.png")
		@x = rand * 640
		@y = rand * 480
	end

	def draw
		@image.draw(@x, @y, ZOrder::Bombs)
	end
end