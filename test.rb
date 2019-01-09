class Shape

    @var = "woohoo"

    def initialize ()

    end

    def area ()
        # @var = "niks"
    end

end


class Rectangle < Shape

    @length
    @width

    def initialize ( l,w )
        @length = l
        @width = w
    end

    def area ()
      puts @var
      return @length * @width
    end

end

a = Rectangle.new(1,1)