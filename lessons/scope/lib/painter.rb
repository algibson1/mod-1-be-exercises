class Painter

  attr_reader :name

  def initialize(name)
    @name = name
    @paints = []
  end

  def greeting
    "Hello, I'm #{name}"
  end

  def get_paints
    @paints
  end

  def add_all_paints(*paints)
    paints.each {|paint| @paints << paint}
  end

  def add_paint(paint)
    @paints << paint
  end

  def paint_names
    get_paints.map do |paint|
      paint.color
    end
  end
end
