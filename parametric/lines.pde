class Lines { 

  float LineNum;
  float Lnp = 10;
  float r = 0;
  float g = 0;
  float b = 0;
  float e = 100;
  float space = 1;
  float velocity;
  float speed;
  float velocitya;
  float speedp = 0.5;
  float frequency = 10;
  float thickness = 0;
  String t1;
  
  void keyControlsandbox() {
    textAlign(CENTER);
    text("Press A to increase or Z to Decrease Speed", 0, -330); 
    text("Press S to increase or Z to Decrease Lines", 0, -310); 
    text("Press D to increase or C Decrease Spacing", 0, -290); 
    text("Press F to start Loop or V to end Loop", 0, -270); 
    text("Press R - G - B to adjust color or L for random", 0, 300); 
    text("Press P to increase or O to decrease Frequency", 0, 320); 
    text("Press T to increase or Y to decrease Thickness", 0, -250); 
    text("Press the SPACE BAR to Reset", 0, 280);  
  }
  
 
  void keysa() {
    //Loop contro
    if (keyPressed) {
      if (key == 'F' || key == 'f') {
        velocitya = velocitya + 0.009;
      }
    }
    if (keyPressed) {
      if (key == 'V' || key == 'v') {
        velocitya = 0;
        velocity = 0;
      }
    }
    //Speed Control
    if (keyPressed) {
      if (key == 'A' || key == 'a') {
        speedp = speedp + 0.01;
      }
    }
    if (keyPressed) {
      if (key == 'z' || key == 'Z') {
        speedp = speedp - 0.01;
      }
    }
    //Line Count control
    if (keyPressed) {
      if (key == 's' || key == 'S') {
        Lnp = Lnp + 0.1;
      }
    }
    if (keyPressed) {
      if (key == 'x' || key == 'x') {
        Lnp = Lnp - 0.1;
      }
    }    
    //Spacing Control
    if (keyPressed) {
      if (key == 'D' || key == 'd') {
        space = space - 0.01;        
        if (space < 0.1 ) {
          space = 0.01;
        }
      }
    }
    if (keyPressed) {
      if (key == 'C' || key == 'c') {
        space = space + 0.01;
      }
    }    
    //Frequency Control
    if (keyPressed) {
      if (key == 'p' || key == 'P') {
        frequency = frequency + 0.01;
      }
    }
    if (keyPressed) {
      if (key == 'o' || key == 'O') {
        frequency = frequency - 0.01;
      }
    }    
    //Thickness
    if (keyPressed) {
      if (key == 't' || key == 'T') {
        thickness += 0.2;
      }
    }
    if (keyPressed) {
      if (key == 'Y' || key == 'y') {
        thickness += -0.2;
          if (thickness < 0.1 ) {
            thickness = 1;
        }
      }
    }
   //Color adjustment
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        r += 1;
      }
    }
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
        g += 1;
      }
    }
    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        b += 1;
      }
    }
    if (keyPressed) {
      if (key == 'L' || key == 'l') {
        r = random(0,255);
        g = random(0,255);
        b = random(0,255);
        thickness = random(1,60);
      }
    }
    if (keyPressed) {
      if (key == ' ') {    
        r = 0;
        g = 0 ;
        b = 0;
        thickness = 0;
        speed = 0.5;
        frequency = 10;
        velocitya = 0;
        velocity = 0;
        
      }
    }  
  }
  void Metric() {
    stroke(r, g, b, e);
    strokeWeight(6+thickness);
    translate(height/2, width/1.95);
    velocity = velocity + velocitya;
    LineNum = Lnp + velocity;
    for (float i = 0; i < LineNum; i = i + space) {
      line(x1(speed+i), y1(speed+i), sizeX(speed+i), sizeY(speed+i));
      line(-x1(speed+i), -y1(speed+i), -sizeX(speed+i), -sizeY(speed+i));
    }
  }
  void Aphysics() { 
    speed = speed + speedp;              
  }
  float x1(float speed) {
    return -sin(speed / frequency) * 180 + -sin(speed/5) * 18;
  }
  float y1(float speed) {
    return -cos(speed / 10) * 230;
  }
  float sizeX(float speed) {
    return -sin(speed / 10) * 230;
  }
  float sizeY(float speed) {
    return -cos(speed / 20) * 230 + -cos(speed* 10);
  }
}
