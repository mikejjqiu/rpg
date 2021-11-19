class player extends GameObject {

  float speed;
  weapon myWeapon;


  player() {
    super();
    speed = 8;
    roomX = 1;
    roomY = 1;
    hp = 100;
    size = 47;
    myWeapon = new pistol();
  }

  void show() {
    fill(white);
    circle(loc.x+1, loc.y, 40);
    image(pp, loc.x-8, loc.y-3, 60, 54);
  }

  void act() {
    super.act();
    movement();
    if (space&&up) loc.y-=speed;
    if (space&&down) loc.y+=speed;
    if (space&&left) loc.x-=speed;
    if (space&&right) loc.x+=speed;
    v.limit(speed);

    checkExit();

    myWeapon.update();
    if (mousePressed) myWeapon.shoot();

    immunity();
  }

  void immunity() {

    imtimer++;
    if (imtimer > 180) {
      dmg();
    }
    if (imtimer <= 180) {
      fill(255, 100);
      circle(loc.x-1, loc.y, 80);
    }
  }

  void dmg() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof ebullet && colliding(myObj)) {
        hp -= 40;
        myObj.hp = 0;
        imtimer = 0;
      }

      if (myObj instanceof boom && colliding(myObj)) {
        hp -= 30;
        myObj.hp = 0;
        imtimer = 0;
        explode(40, loc.x, loc.y, 17, 1);
      }

      if (myObj instanceof follower && colliding(myObj)) {
        hp -= 1;
      }
    }
  }








  void checkExit() {
    if (nRoom != white && loc.y == height*0.1 && loc.x >= width/2 - 50 && loc.x <= width/2 + 50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }

    if (eRoom != white && loc.x == width*0.9 && loc.y >= height/2 - 50 && loc.y <= height/2 + 50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }

    if (sRoom != white && loc.y == height*0.9 && loc.x >= width/2 - 50 && loc.x <= width/2 + 50) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10);
    }

    if (wRoom != white && loc.x == width*0.1 && loc.y >= height/2 - 50 && loc.y <= height/2 + 50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }
  }

  void movement() {
    if (up) v.y = -speed;
    if (down) v.y = speed;
    if (left) v.x = -speed;
    if (right) v.x = speed;


    if (!up && !down) v.y = 0;
    if (!left && !right) v.x = 0;
  }
}
