#Problem: https://exercism.org/tracks/ruby/exercises/resistor-color

# Solution
class ResistorColor
    COLORS= %w[black brown red orange yellow green blue violet grey white]
    def self.color_code(color)
      COLORS.find_index(color)
    end
    def colors
      COLORS
    end
end