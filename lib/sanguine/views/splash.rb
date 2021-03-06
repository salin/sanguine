module Sanguine

  module View
  
    class Splash < View
      
      def initialize
        super(Point.new(200, 200))
        f = File.dirname(__FILE__) + "/../../../resources/splash.png"
        @image = Gosu::Image.new(window, f, false)
      end
      
      def draw
        super
        @image.draw(300, 30, 0)
      end
      
    end
    
  end
  
end                     