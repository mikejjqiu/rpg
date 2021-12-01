class enemy extends GameObject {

  color c;

  enemy() {
    loc = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    hp = 10000;
    roomX = 1;
    roomY = 1;
    size = 50;
    c = lpurple;
  }

  enemy(int hp1, int s1, int x, int y, color c1) {
    loc = new PVector(random(0.2*width, 0.8*width), random(0.2*height, 0.8*height));
    
    v = new PVector(0, 0);
    hp = hp1;
    roomX = x;
    roomY = y;
    size = s1;
    c = c1;
  }

  void show() {
    fill(c);
    noStroke();
    circle(loc.x, loc.y, size);
    //fill(lyellowg);
    
    //textSize(20);
    //text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();
    collision();
  }

  void collision() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof bullet && colliding(myObj)) {
        hp = hp - myObj.size/4 - int(myObj.v.mag());
        myObj.hp = 0;
        if (hp<=0) myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY));
      }
    }
  }
}
