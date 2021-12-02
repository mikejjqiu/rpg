class player extends GameObject {

  weapon myWeapon;
  gif curAct;

  player() {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 80;
    myWeapon = new shotgun();
    curAct = rest;
    maxHP = hp = 100;
    xp = 0;
    damage = 0;
  }




  void show() {
    if (curAct == attack) {
      curAct.show1(loc.x, loc.y, size/1.5, size);
      int i = 0;
      i++;
      if (i>=14) curAct = rest;
    } else curAct.show1(loc.x, loc.y, size/1.5, size);
    Hbar();
  }


  void act() {
    super.act();
    movement();
    checkExit();
    myWeapon.update();
    if (mousePressed) {

      for (int i = 0; i<30; i++) {
        if (i>=29) {
          myWeapon.shoot(); 
          print("p");
        }
        println(i);
      }
      curAct = attack;
    }
    immunity();
  }



  void immunity() {
    imtimer++;
    if (imtimer > 180) {
      dmg();
    }
    if (imtimer <= 180) {
      noFill();
      stroke(dpurple);
      strokeWeight(3);
      ellipse(loc.x-1, loc.y, 50, 70);
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
        if (item.type == HEALTH) {
          item.hp = 0;
          hp += 20;
          if (hp>maxHP) hp = maxHP;
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
    v.setMag(speed);
    if (up) v.y = -speed;
    if (down) v.y = speed;    
    if (left) v.x = -speed; 
    if (right) v.x = speed;


    if (abs(v.y) > abs(v.y)) {
      //if (v.y>=0) curAct = d1;
      //else curAct = ;
    } else {
      if (v.x > 0) curAct = r2;
      else curAct = l2;
    }
    if (v.x == 0 && v.y == 0) curAct = rest;

    if (!up && !down) v.y = 0;
    if (!left && !right) v.x = 0;
  }


  void Hbar() {
    rectMode(CORNER);
    fill(red);
    rect(loc.x-size/2, loc.y-40, 50, 5);

    fill(green);

    float x = map(hp, 0, 100, 0, 50);
    rect(loc.x-size/2, loc.y-40, x, 5);
  }
}
