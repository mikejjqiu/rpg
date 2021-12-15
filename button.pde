class Button {

  int x, y, w, h;
  boolean clicked, selected;
  color highlight, normal;
  String text;
  PImage hh;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  Button(color c, PImage hh_) {
    normal = c;
    hh = hh_;
    //clicked = false;
    //selected = false;
  }


  Button() {
    text = "+";
    highlight = lyellowg;
    normal = white;
    clicked = false;
  }

  void show() {
    //rectangle
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(0.7*h);
    fill(255);
    text(text, x, y);

    click();
  }

  void show1(float x1, float y1, int w1) {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    fill(black);
    square(x1+5, y1+5, w1);

    if (mouseX > x1-w1/2 && mouseX < x1+w1/2 && mouseY > y1-w1/2 && mouseY < y1+w1/2) fill(highlight);
    else fill(normal);

    noStroke();
    square(x1, y1, w1);


    fill(black);
    textSize(0.8*w1);
    text(text, x1, y1-3);
    if (mouseReleased && mouseX > x1-w1/2 && mouseX < x1+w1/2 && mouseY > y1-w1/2 && mouseY < y1+w1/2) clicked  = true;
    else clicked = false;
  }

  void show2(float x1, float y1, float w1, float h1) {

    if (mouseX > x1 - w1/2 && mouseX < x1 + w1/2 && mouseY > y1 - h1/2 && mouseY < y1 + h1/2) {
      clicked = true;
      if (mousePressed) { 
        selected = true;
        //print("222");
        //fill(red);
      }
      //else print("111");
    } else if (mousePressed) selected = false; //else print("333");
    //  //  print("1");
    //  //}
    //} //else { 
    //clicked = false;
    //println("out");
    //if (mouseReleased) {
    //  selected = false; 
    //  print("2");
    //}
    //}


    if (clicked)  fill(black);
    if (selected) fill(red);
    //else fill(normal);

    rect(x1, y1, w1, h1, 30);
    //image(hh, x1, y1, 0.8*w1, 0.8*h1);
  }

  void click() {
    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-w/2 && mouseY < y+w/2) clicked  = true;
    else clicked = false;
  }
}
