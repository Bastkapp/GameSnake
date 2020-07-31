import java.util.Arrays;

class Highscore {
  String dir = "score\\highscore.txt";
  User user;
  ArrayList<User> users;
  ArrayList<String> score;
  
//==========================Read from File==========================  
  
  void getScore() {
    users = new ArrayList<User>();
    score = new ArrayList<String>();
    String[] lines = loadStrings(dir);
    for(int i = 0; i < lines.length; i++) {
      String[] line = split(lines[i], ": ");
      if(lines[0] != "") {
        System.out.println(lines[i]);
        users.add(new User(line[0], int(line[1])));
        score.add(lines[i]);
      }
    }
    if(user.getName().equals("") || user.getName() == null) {
      saveScore();
      users.add(user);
      score.add(user.getName() + ": " + user.getScore());
    } else {
      users.add(user);
      score.add(user.toString());
      saveScore();
    }
  }
  
//==========================Write to File==========================

  void saveScore() {
    saveStrings(dir, score.toArray(new String[score.size()]));
  }
  
//===========================DRAW==================================================
  
  String outString(User user) {
    String output = "";
    this.user = user;
    getScore();
    
    sort();
    
    int place = locateUser();
    
    nummerate();
    
    if(place == 1) {
      output = "You got a new Highscore\n";
    } else {
      output = "You are on place #" + place + "\n";
    }
    
    output = output + "\nTop 10:";
    
    for(int i = 0; i < score.size() && i < 10; i ++) {
      output = output + "\n" + score.get(i);
    }
    
    return output;
  }
  
  int locateUser() {
    int output = score.indexOf(user.toString()) + 1;
    if(output == 0) {
      output = score.size() + 1;
    }
    return output;
  }
  
  void nummerate() {
    ArrayList<String> strings = new ArrayList<String>();
    for(int i = 0; i < score.size(); i ++) {
      if(!score.get(i).equals(user.toString()) || user.getName() != "") {
        strings.add((i + 1) + "| " + score.get(i));
      }
    }
    score = strings;
  }
  
  void sort() {
    String[] strings = score.toArray(new String[score.size()]);
    for(int i = 0; i < strings.length; i++) {
      for(int j = 0; j < strings.length; j++) {
        if(int(split(strings[i], ": ")[1]) > int(split(strings[j], ": ")[1])) {
          String temp = strings[j];
          strings[j] = strings[i];
          strings[i] = temp;
        }
      }
    }
    
    score = new ArrayList<String>(Arrays.asList(strings));
  }
  
}
