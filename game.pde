void game() {

  room();
  obj();
  d();
  minimap();
  hp();
  textAlign(CENTER, CENTER);
}









void room() {

  rectMode(CENTER);
  strokeWeight(3);
  fill(mgrey);
  image(bg, width/2, height/2, width, height);
  stroke(#5C6463);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  // exits
  nRoom = map.get(myPlayer.roomX, myPlayer.roomY-1);
  sRoom = map.get(myPlayer.roomX, myPlayer.roomY+1);
  eRoom = map.get(myPlayer.roomX+1, myPlayer.roomY);
  wRoom = map.get(myPlayer.roomX-1, myPlayer.roomY);
  // doors
  noStroke();
  fill(black);
  if (nRoom != white) circle(width/2, height*0.1, 100);
  if (sRoom != white) circle(width/2, height*0.9, 100);
  if (eRoom != white) circle(width*0.9, height/2, 100);
  if (wRoom != white) circle(width*0.1, height/2, 100);

  fill(black);
  rect(width/2, height/2, width*0.8, height*0.8);
  image(floor, width/2, height/2, width*0.8-20, height*0.8-20);
}



void obj() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject myObj = myObjects.get(i);

    if (myObj.roomX == myPlayer.roomX && myObj.roomY == myPlayer.roomY) {
      myObj.show();
      myObj.act();
    }

    if (myObj.hp <= 0) {
      myObjects.remove(i);
      i--;
    }
  }
}



void d() {
  lightlayer.show();
}

void minimap() {
  int x = 0, y = 0;
  int x1 = 30, y1 = 30;
  float size = 7;
  while (y <= map.height) {
    color c = map.get(x, y);
    fill(c, 150);
    noStroke();
    square(x1, y1, size);
    x++;
    x1 += size;
    if (x >= map.width) {
      x = 0;
      y++;
      x1 = 30;
      y1 += size;
    }
  }

  fill(lyellowg);

  circle(myPlayer.roomX*7+30+size/2, myPlayer.roomY*7+30+size/2, size*0.8);
}

void hp() {
  textAlign(RIGHT, CENTER);
  fill(red);
  text(myPlayer.hp, width-30, 80);
}
