module Sanguine

  module View
  
    class Character < View
      
      def initialize
        super(Point.new(10, Config::ScreenHeight - 130))
      end
      
      def tab
        # increment the x positioning holder by the font size multiplied by arbitrary amount
        @x = @x + Config::DefaultFontSize * 3
      end
      
      def space
        # increment the x positioning holder by the font size multiplied by arbitrary amount
        @x = @x + Config::DefaultFontSize
      end
      
      def draw
        super

        window.draw_box(@location.x, @location.y, 280, 120, window.gosu_colour(:border))
        
        window.write("#{player.name}", @x + 10, @y + 10)
        newline
        window.write("#{player.race.name} #{player.profession.name}", @x + 10, @y + 10)
        newline
        newline
  
        window.write("Health #{player.health.to_i} / #{player.max_health}", @x + 10, @y)
        newline
        window.write("Mana #{player.mana.to_i} / #{player.max_mana}", @x + 10, @y)
        newline
        window.write("Xp #{player.mana.to_i} / #{player.max_mana}", @x + 10, @y)
        newline
        newline
        player.effects.temporary.each do |effect|
          window.write("#{effect.name} [#{effect.duration.to_s}]", @x, @y)
          newline
        end
    
      end
      
    end
    
  end
  
end                     