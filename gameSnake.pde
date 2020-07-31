Player player;
Point point;
User user;
Highscore highscore = new Highscore();
Grid grid = new Grid();
float[] pos = new float[2];
color bg = color(122, 229, 130);
int i;
char button = 'd';
boolean pause = false;
String status = "unbegun";

void setup() {
  frameRate(15);
  size(600, 600, P2D);
  textSize(20);
  i = 0;
  textAlign(LEFT);
  status = "start";
}

void draw() {
  if(status("start")) {
    startGame();
  } else if(status("getUsername")) {
    userName();
  } else if(status("running")) {
    runGame();
  } else if(status("lost")) {
    endGame();
  }
}

// ==============================Start==============================
void startGame() {
  user = new User();
  player = new Player();
  point = new Point(player);
  userName();
  button = 'd';
}



void userName() {
  status = "getUsername";
  fill(0);
  background(bg);
  text("Enter your Username: "+user.getName(), width/50, height/20);
}

//==============================End==============================

void endGame() {
  if(i == 0) {
    background(255, 16, 83);
    text("You have failed with a score of " + user.getScore()
      + "\n\n" + highscore.outString(user) + "\n\nPress ENTER to try again", width/50, height/20);
    i++;
  }
}  

//==============================Running==============================
void runGame() {
  background(bg);
  grid.draw();
  point.draw();
  player.draw();
  player.move(button);
  
  if(point.check()) {
    player.score();
    user.addScore();
  }
  
  if(player.checkHit()) {
    status = "lost";
  }
  
}

//==============================Keypress==============================

void keyPressed() {/*
  if(key == 'w' || key == 'a' || key == 's' || key == 'd') {
    button = key;
  }
  if(key==' ' && pause == false) {
    pause = true;
  } else if(key==' ') {
    pause = false;
  }*/
}

void keyReleased() {/*
    if(keyCode == ENTER) {
      if(status("lost") || status("running")) {
        status = "start";
        i = 0;
      } else if(status("getUsername")) {
        status = "running";
      }
    }*/
   
}

void keyTyped() {
  println("keyTyped");
  println(key == CODED, key, BACKSPACE, key == BACKSPACE);
    if(((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z') || (key >= '0' && key <= '9') || key == ' ') && (key != CODED && keyCode != ENTER)) {
      user.addLetter(key);
    } else if(key == BACKSPACE) {
      System.out.println("detected Backspace");
      user.remLetter();
    }
    System.out.println(user.getName());
  
}

//==============================Others==============================

boolean status(String status) {
  return this.status.equals(status);
}
