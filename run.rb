require_relative "player"
require_relative "star"
require_relative "bomb"
require_relative "base_shot"
require_relative "superstar"
require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super 640, 480
		self.caption = "Gosu Tutorial Game"

		@background_image = Gosu::Image.new("space.png", :tileable => true)

		@player = Player.new
		@player.warp(320,240)

		@star_anim = Gosu::Image::load_tiles("star.png", 40, 42)
		@stars = Array.new

		@font = Gosu::Font.new(20)

		@bombs = Array.new
		@shot = BaseShot.new


	end

	def update
		if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
			@player.turn_left
		end
		if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
			@player.turn_right
		end
		if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
			@player.accelerate
		end
		@player.x_pos
		@player.y_pos
		@player.move
		@shot.update(@player.x_pos, @player.y_pos, @player.angle)
		if @player.timer?
			@player.collect_stars(@stars)
			@player.collides(@bombs)
			@player.collides_laser(@bombs)
		end

		if rand(100) < 4 and @stars.size < 25 then
			@stars.push(Star.new(@star_anim))
		end

		if rand(100) < 4 and @stars.size < 25 then
			@stars.push(SuperStar.new(@star_anim))
		end

		if rand(100) < 3 and @bombs.size < 5 then
			@bombs.push(Bomb.new)
		end


	end

	def draw
		@player.draw
		@background_image.draw(0,0,0)
		
		@font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
		if @player.timer?
			@stars.each{|star| star.draw}
			@bombs.each{|bomb| bomb.draw}
			
			@font.draw("Timer: #{@player.timer/ 1000}", 30, 30, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
		end
		if !@player.timer?
			@player.timer == 0
			@font.draw("Game Over", 220, 220, ZOrder::UI, 3.0, 3.0,0xff_ffff00)
		end
		if Gosu::button_down? Gosu::KbSpace then
			@shot.move
			@shot.draw
		end
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show