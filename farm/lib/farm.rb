using Article

# Null object in h-myah.
class SilentAnimal
  def sound
    '<silence>'
  end

  def species
    '<silence>'
  end
end

class AnimalFactory
  def self.for(animal)
    animal || SilentAnimal.new
  end
end

class Farm
  attr_reader :animals

  def initialize(animals)
    @animals = animals
  end

  def lyrics
    animals.collect { |animal| verse(AnimalFactory.for(animal)) }.join("\n\n")
  end

  def verse(animal)
    sound   = animal.sound
    species = animal.species
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
      "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
      "With #{sound.articlize} #{sound} here " +
        "and #{sound.articlize} #{sound} there,\n" +
      "Here #{sound.articlize}, there #{sound.articlize}, " +
        "everywhere #{sound.articlize} #{sound},\n" +
      "Old MacDonald had a farm, E-I-E-I-O."
  end
end
