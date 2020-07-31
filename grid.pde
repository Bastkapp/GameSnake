class Grid {
  color col = color(157, 223, 42);
  Grid() { }
  
  void draw() {
    stroke(col);
    for(int i = 0; i <= width; i += new Section(0, 0).getSize()) {
      line(0, i, width, i);
    }
    for(int i = 0; i <= height; i += new Section(0, 0).getSize()) {
      line(i, 0, i, height);
    }
  }
}
