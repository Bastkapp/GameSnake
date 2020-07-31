class Player {
  ArrayList<Section> sections = new ArrayList<Section>();
  int playerLength = 3;
  float step;
  char lastDir = 'd';
  char dir;
  float[] pos;
  
  Player() {
    step = new Section(0, 0).getSize();
    sections.add(new Section(0, 0));
  }
  
//==========================Movement==========================

  void move(char dir) {
    this.dir = dir;
    pos = sections.get(sections.size()-1).getPos();
    println();
    newPos();
    remOverhang();
    sections.add(new Section(pos[0], pos[1]));
    
    if(sections.size() > playerLength) {
      sections.remove(0);
    }
  }
    
  void remOverhang() {
    for(int i = 0; i <= 1; i++) {
      float side =(i == 0)? width : height;
      if(pos[i] < 0) {
        pos[i] = side - step;
      } else if(side < pos[i] + step) {
        pos[i] = 0;
      }
    }
  }
    
  void newPos() {
    switch (dir) {
      case 'w':
      case 'W':
        if(lastDir != 's') {
          posUp();
          lastDir = 'w';
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case 'a':
      case 'A':
        if(lastDir != 'd') {
          posLeft();
          lastDir = 'a';
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case 's':
      case 'S':
        if(lastDir != 'w') {
          posDown();
          lastDir = 's';
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case 'd':
      case 'D':
        if(lastDir != 'a') {
          posRight();
          lastDir = 'd';
        } else {
          dir = lastDir;
          newPos();
        }
        break;
    }
  }
  float[] newPos(float[] pos, char dir) {
    float[] posNew = new float[2];
    posNew[0] = pos[0];
    posNew[1] = pos[1];
    switch (dir) {
      case 'w':
      case 'W':
        posNew[1] = posNew[1] - step;
        break;
      case 'a':
      case 'A':
        posNew[0] = posNew[0] - step;
        break;
      case 's':
      case 'S':
        posNew[1] = posNew[1] + step;
        break;
      case 'd':
      case 'D':
        posNew[0] = posNew[0] + step;
        break;
    }
    
    posNew = remOverhang(posNew, step);
    
    if(posNew[0] == pos[0] && posNew[1] == pos[1]) {
      println(printPos(pos) + printPos(posNew));
      posNew = newPos(pos, dir);
    }
    return posNew;
  }
  
  float[] remOverhang(float[] pos, float step) {
    if(pos[0] < 0) {
      pos[0] = width - step;
    } else if(width < pos[0] + step) {
      pos[0] = 0;
    }
    
    if(pos[1] < 0) {
      pos[1] = height - step;
    } else if(height < pos[1] + step) {
      pos[1] = 0;
    }
    
    return pos;
  }
    
  void posUp() {
    pos[1] = pos[1] - step;
  }
  
  void posDown() {
    pos[1] = pos[1] + step;
  }
  
  void posLeft() {
    pos[0] = pos[0] - step;
  }
  
  void posRight() {
    pos[0] = pos[0] + step;
  }
  
  
//==========================Others==========================
  
  
  String printPos(float[] pos) {
    return "("+pos[0]+";"+pos[1]+")";
  }
  
  String printPos() {
    return "("+pos[0]+";"+pos[1]+")";
  }
  
  void score() {
    playerLength = playerLength + 2;
  }
  
  void draw() {
    for(int i = 0; i < sections.size(); i++) {
     sections.get(i).draw();
    }
  }
  
  ArrayList<Section> getSections() {
    return sections;
  }
  
  int getLength() {
    return playerLength;
  }

  boolean checkHit() {
    float[] pos = new float[2];
    pos = sections.get(sections.size()-1).getPos();
    for(int i = 0; i < sections.size()-2;i++) {
      if(pos[0] == sections.get(i).getPos()[0] && pos[1] == sections.get(i).getPos()[1]) {
        return true;
      }
    }
    return false;
  }
}
