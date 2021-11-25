class boom extends enemy {
  int timer = 0;
  boom(int x, int y) {
    super(100, 50, x, y, black);
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
    else if (d <= size/2+myPlayer.size/2 && imtimer < 180) {
      explode(20, loc.x, loc.y, 17, 1);
      hp = 0;
    }
  }
}


class turret extends enemy {
  int timer = 0;
  turret(int x, int y) {
    super(200, 100, x, y, black);
  }
  void show() {
    image(turret,loc.x,loc.y,size,size);
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
    super(100, 50, x, y, black);
  }
  void show() {
    super.show();
  }
  void act() {
    super.act();
    v = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
    v.setMag(2);
  }
}
//class spawningpool extends enemy {
//}
