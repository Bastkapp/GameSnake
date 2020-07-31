class User {
  String name = "";
  int score = 0;
  
  User() {  }
  User(String name, int score) {
    this.name = name;
    this.score = score;
  }
  
  void setName(String name) {
    this.name = name;
  }
  
  String getName() {
    return name;
  }
  
  void addLetter(char letter) {
    this.name = name + letter;
  }
  
  void remLetter() {
    if(name.length() > 0) {
      System.out.println("rem");
      name = name.substring(0, name.length() - 1);
    }
  }
  
  void addScore() {
    this.score++;
  }
  
  int getScore() {
    return score;
  }
  
  void setScore(int score) {
    this.score = score;
  }
  
  String toString() {
    return this.name + ": " + this.score;
  }
}
