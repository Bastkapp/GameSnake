class Section {
  float[] pos = new float[2];
  float sectionSize = width/20;
  color clr = color(0, 0, 0);
 
  Section(float posX, float posY) {
    this.pos[0] = posX;
    this.pos[1] = posY;
  }
  
  float[] getPos() {
    return pos;
  }
  
  float getSize() {
    return sectionSize;
  }
    
  void draw() {
    fill(0);
    stroke(255);
    rect(pos[0], pos[1], sectionSize, sectionSize);
  }
}
