class Empty
  @color = 'Blue'
  @@picture = ' '
  def show_black
    print @@picture.on_black
  end

  def show_white
    print @@picture.on_white
  end

  def show_blue
    print @@picture.on_blue
  end
end
