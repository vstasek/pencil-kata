module Writing
  class Pencil
    attr_reader(
      :length,
      :point_durability,
      :eraser_durability
    )

    def initialize length: 10, point_durability: 1000, eraser_durability: 1000
      @length = length
      @point_durability = point_durability
      @eraser_durability = eraser_durability
    end

    def write paper, text
      text.each_char{ |c|
        if dull?
          paper << ' '
        else
          paper << c
        end
        degrade c
      }

      paper
    end

    def dull?
      point_durability < 1
    end

    private
      def degrade c
        if c.match?(/[A-Z]/)
          @point_durability -= 2
        elsif c.match?(/\s/)
          @point_durability -= 0
        else
          @point_durability -= 1
        end
      end
  end
end