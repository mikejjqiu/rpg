class DroppedItem extends GameObject {

  int type;
  weapon w;
  color c;

  float r = random(0, 100);
  PImage shotgun, fireball;

  DroppedItem(float x, float y, int rx, int ry) {
    type = GUN;
    hp = 1;
    loc = new PVector(x, y);
    v = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = yellow;

    weapons();
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(c);
    circle(loc.x, loc.y, size);
  }


  void weapons() {
    println(r);
    if (r>=55&&r<=80) w = new fireball();
    if (r<=15) w = new pistol();
    if (r>15&&r<30) w = new pewpew();
    if (r>=30&&r<55) w = new shotgun();
    if (r>95&&r<=100) w = new fireball1();
    if (r>80&&r<=95)  w = new fireball2();
  }

  void weapon() {
    if (r>=55&&r<=90) w = new fireball();
    if (r<=15) w = new pistol();
    if (r>15&&r<30) w = new pewpew();
    if (r>=30&&r<55) w = new shotgun();
    if (r>90&&r<=100) w = new fireball1();
    if (r>80&&r<=95)  w = new fireball2();
  }
}
