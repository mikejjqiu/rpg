class player extends GameObject {

  float speed;
  weapon myWeapon;
  gif curAct;

  player() {
    super();
    speed = 8;
    roomX = 1;
    roomY = 1;
    hp = 100;
    size = 50;
    myWeapon = new fireball2();
    curAct = d1;
  }

  void show() {

    curAct.show1(loc.x, loc.y, size/1.5, size);
  }

  void act() {
    super.act();
    movement();

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

      if (myObj instanceof DroppedItem && colliding(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp = 0;
        }
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
    v.limit(speed);
    if (up) {
      v.y = -speed;
      curAct = u1;
    }
    if (down) {
      v.y = speed;      
      curAct = d1;
    }
    if (left) {
      v.x = -speed;      
      curAct = l1;
    }
    if (right) {
      v.x = speed;      
      curAct = r1;
    }

    //if (abs(v.y) > abs(v.y)) {
    //  if (v.y>=0) curAct = d1;
    //  else curAct = u1;
    //} else {
    //  if (v.x > 0) curAct = r1;
    //  else curAct = l1;
    //}

    if (!up && !down) v.y = 0;
    if (!left && !right) v.x = 0;
  }
}


void Hbar() {
  rectMode(CENTER);
  fill(red);
  rect(myPlayer.loc.x, myPlayer.loc.y-40, 50, 10);

  fill(green);

  //float x = map(
  //  rect(myPlayer.loc.x, myPlayer.loc.y-40, x, 10);
}
