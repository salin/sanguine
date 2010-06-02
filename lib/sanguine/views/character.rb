module Sanguine

  module View
  
    class Character < View
      
      def initialize
        super(Point.new(50, 55))
        file = File.dirname(__FILE__) + "/../../../resources/background_character.png"
        @background = Gosu::Image.new(window, file, false)    
      end
      
      def tab
        # increment the x positioning holder by the font size multiplied by arbitrary amount
        @x = @x + Config::DefaultFontSize * 8
      end
      
      def draw
        super
        
        # draw background image, 700.0 is actual image height
        @background.draw(0, 0, 0, 1.0, Config::ScreenHeight / 700.0)  
        
        window.write("#{player.name}", @x, @y)
        newline
        window.write("#{player.race.name} #{player.profession.name}", @x, @y)
        newline
        window.write("Level #{player.level}  (#{player.exp_needed}xp to lvl)", @x, @y)
        newline
        newline
        window.write("Strength:", @x, @y)
        tab
        window.write("#{player.strength}", @x, @y)     
        newline  
        window.write("Toughness:", @x, @y)
        tab
        window.write("#{player.toughness}", @x, @y)
        newline
        window.write("Agility:", @x, @y)
        tab
        window.write("#{player.agility}", @x, @y)
        newline
        window.write("Intelligence:", @x, @y)
        tab
        window.write("#{player.intelligence}", @x, @y)
        newline
        window.write("Willpower:", @x, @y)
        tab
        window.write("#{player.willpower}", @x, @y)
        newline
        window.write("Fellowship:", @x, @y)
        tab
        window.write("#{player.fellowship}", @x, @y)
        newline
        newline
        window.write("Attack:", @x, @y)
        tab
        window.write("#{player.attack}", @x, @y)
        newline
        window.write("Defense:", @x, @y)
        tab
        window.write("#{player.defense}", @x, @y)
        newline
        newline
        window.write("Melee:", @x, @y)
        tab
        window.write("#{player.damage_output}", @x, @y)
        newline
        window.write("Strikes:", @x, @y)
        tab
        window.write("#{player.strikes}", @x, @y)
        newline
        newline
        window.write("Ranged:", @x, @y)
        tab
        window.write("#{player.ranged_damage_output}", @x, @y)
        newline
        window.write("Ammunition:", @x, @y)
        tab
        window.write("#{player.equipment.ammunition_quantity}", @x, @y)
        newline
        newline
        window.write("Resistances", @x, @y)
        newline
        window.write("{physical}Physical", @x, @y)
        tab
        window.write("#{player.resistance(:physical)}", @x, @y)
        newline
        window.write("{red}Fire", @x, @y)
        tab
        window.write("#{player.resistance(:fire)}", @x, @y)
        newline
        window.write("{blue}Cold", @x, @y)
        tab
        window.write("#{player.resistance(:cold)}", @x, @y)
        newline
        window.write("{yellow}Electricity", @x, @y)
        tab
        window.write("#{player.resistance(:electricity)}", @x, @y)
        newline
        window.write("{poison}Poison", @x, @y)
        tab
        window.write("#{player.resistance(:poison)}", @x, @y)
        newline
        newline
        window.write("Health", @x, @y)

        window.write("{red}#{player.health.to_i} {black}/ #{player.max_health}", @x + 80, @y)
        newline
        window.write("Mana", @x, @y)
        window.write("{blue}#{player.mana.to_i} {black}/ #{player.max_mana}", @x + 80, @y)
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