class ebullet extends GameObject {

  PVector aimVector;
  PImage[] g;

  ebullet(float x, float y, PVector aim1, int size1) {
    loc = new PVector(x, y);
    aimVector = aim1;
    size = size1;
    hp = 1;
    v = new PVector(0, 0);
    v.rotate(random(-1, 1));
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
  }

  void show() {
    fill(dgreen);
    circle(loc.x, loc.y, size);
  }


  void act() {
    loc.add(v);
    v.add(aimVector);
    v.setMag(8);
    colors();
    if (loc.x <= width*0.1 || loc.x >= width*0.9 || loc.y <= height*0.1 || loc.y >= height*0.9) {
      hp = 0;
    }
  }

  void colors() {
    float cc = random(0, 3);

    if (cc<1)
      explode(10, loc.x, loc.y, 4, 1);

    if (cc>1 && cc<2)
      explode(10, loc.x, loc.y, 4, 1);

    if (cc>2)
      explode(10, loc.x, loc.y, 4, 1);
  }
}
