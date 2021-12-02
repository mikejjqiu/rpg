class boom extends enemy {
  int timer = 0;
  boom(int x, int y) {
    super(100, 30, x, y, white, 5);
  }

  void show() {
    super.show();
  }
  void act() {
    super.act();
    float d = dist(loc.x, loc.y, myPlayer.loc.x, myPlayer.loc.y);
    if (d<=300) {
      v = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      v.setMag(5);
      timer++;
      if (timer == 5) {
        myObjects.add(new bullet(loc, v, green, 10));
        timer = 0;
      }
    }
    if (hp <= 0) 
      explode(20, loc.x, loc.y, 17, 1);
    else if (d <= size/2 + myPlayer.size/2 && imtimer < 180) {
      explode(20, loc.x, loc.y, 17, 1);
      hp = 0;
    }
  }
}


class turret extends enemy {
  int timer = 0;
  turret(int x, int y) {
    super(200, 100, x, y, black, 5);
  }
  void show() {
    image(turret, loc.x, loc.y, size, size);
  }
  void act() {
    super.collision();
    timer++;
    if (timer==50) {
      PVector aim = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      myObjects.add(new ebullet(loc.x-1, loc.y-27, aim, 10));
      timer = 0;
    }
  }
}

class follower extends enemy {
  follower(int x, int y) {
    super(100, 21, x, y, white, 1);
  }
  void show() {
    super.show();

    if (v.x>0) image(fol1, loc.x-5, loc.y+5, 30, 30);
    else image(fol2, loc.x+4, loc.y-4, 30, 30);
  }
  void act() {
    super.act();
    v = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
    v.setMag(2);
  }
}
//class spawningpool extends enemy {
//}
