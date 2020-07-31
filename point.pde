class Point {
  float[] pos = new float[2];
  float size = new Section(0, 0).getSize();
  color col = color(217, 4, 41);
  Player player;

  Point(Player player) {
    this.player = player;
    newPos();
  }

  void newPos() {
    pos[0] = stepRandom(0, width, size);
    pos[1] = stepRandom(0, height, size);
    if (inSection()) {
      newPos();
    }
  }

  void draw() {
    fill(col);
    rect(pos[0], pos[1], size, size);
  }

  boolean inSection() {
    for (Section s : player.getSections()) {
      if (s.getPos()[0] == pos[0] && s.getPos()[1] == pos[1]) {
        return true;
      }
    }
    return false;
  }

  float stepRandom(float min, float max, float step) {
    int rand1 = (int) random(min, max);
    if (rand1%step != 0) {
      rand1 = (int) stepRandom(min, max, step);
    }
    return rand1;
  }

  boolean check() {
    if (inSection()) {
      newPos();
      return true;
    }
    return false;
  }
}
