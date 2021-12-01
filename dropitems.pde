class DroppedItem extends GameObject {

  int type;
  weapon w;
  color c;


  DroppedItem(float x, float y, int rx, int ry) {

    float r1 = random(0, 2);
    if (r1 > 1) {
      type = GUN;
      weapons();
    }

    if (r1 <= 0.5) type = HEALTH;

    hp = 1;
    loc = new PVector(x, y);
    v = new PVector(0, 0);
    size = 30;
    roomX = rx;
    roomY = ry;
    c = yellow;
  }

  void show() {

    if (type==GUN)fill(c);
    else if (type==HEALTH)fill(red);
    else noFill();

    //    stroke(black);
    //    strokeWeight(2);
    circle(loc.x, loc.y, size);
  }


  void weapons() {
    float r = random(0, 100);
    println(r);
    if (r>=55&&r<=80) w = new fireball();
    if (r<=15) w = new pistol();
    if (r>15&&r<30) w = new pewpew();
    if (r>=30&&r<55) w = new shotgun();
    if (r>95&&r<=100) w = new fireball1();
    if (r>80&&r<=95)  w = new fireball2();
  }

  void weapon() {
    float r = random(0, 100);
    if (r>=55&&r<=90) w = new fireball();
    if (r<=15) w = new pistol();
    if (r>15&&r<30) w = new pewpew();
    if (r>=30&&r<55) w = new shotgun();
    if (r>90&&r<=100) w = new fireball1();
    if (r>80&&r<=95)  w = new fireball2();
  }
}
