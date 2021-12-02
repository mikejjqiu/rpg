// ================================
//final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;

//modes ============================
int mode = 0;
final int intro = 1;
final int game = 2;
final int pause = 3;
final int gameover = 4;

//gif ===================
gif g_l, gi;

//button ====================
boolean mouseReleased;
boolean hadPressed;
Button buttoni;

//palette ===================================
color dgreen = #4a6fa5, mgreen = #3EBC19, green = #19FC0A;
color mred = #A02520, red = #D3231A;
color dblue = #1A3037, blue = #1DB7F2;
color lyellowg = #D7E3A1, dyellowg = #B6C17D;
color black = #030C12;
color dpurple = #2E2F51, lpurple = #8C7CA8;
color dbrown = #1C1912, mbrown = #4D4035, yellow = #EAE128;
color mgrey = #5A4F55, white = #FFFFFF;
color e = #ff8100, f = #842555, t = #002fff;

//gameobj ========================
ArrayList<GameObject> myObjects;

//player ==============
PImage pp;
boolean up, down, left, right, space;
player myPlayer;

// map ====================
PImage map;
color nRoom, sRoom, eRoom, wRoom;
PImage bg, floor;

// darkness =========================
ArrayList<Darkness> darkness;
Darkness lightlayer;

int imtimer;

// ======================================
PImage turret, fol1, fol2;

// =====================================
gif u1, d1, l1, r1;
gif l2, r2, rest, attack;


// ===========================
images shotgun, fireball, fireball1, fireball2, pewpew, pistol;
PImage shotgun_, fireball_, fireball1_, fireball2_, pewpew_, pistol_;

void setup() {
  size(800, 600, P2D);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  //gif =====================
  g_l = new gif(3, "level/frame_", "_delay-0.2s.gif", width/4, height/2, 470, height, 7);
  gi = new gif(33, "intro/frame_", "_delay-0.08s.gif", width/2, height/2, 850, 850, 4);

  //button =============================
  buttoni = new Button("Start", width/2, 500, 200, 80, dblue, lyellowg);


  //player =================================================
  u1 = new gif(4, "man/up/sprite_", ".png", 5);
  d1 = new gif(4, "man/down/sprite_", ".png", 5);
  l1 = new gif(4, "man/left/sprite_", ".png", 5);
  r1 = new gif(4, "man/right/sprite_", ".png", 5);
  
  l2 = new gif(9, "hero/left/frame_", "_delay-0.07s-PhotoRoom.png", 2);
  r2 = new gif(9, "hero/right/frame_", "_delay-0.07s-PhotoRoom.png", 2);
  rest = new gif(12, "hero/rest/frame_", "_delay-0.09s-PhotoRoom.png", 7);
  attack = new gif(15, "hero/attack/frame_", "_delay-0.04s-PhotoRoom.png", 1);

  //objs ========================
  myObjects = new ArrayList<GameObject>();
  myPlayer = new player();
  myObjects.add(myPlayer);

  myObjects.add(new enemy());

  // mode ====================
  mode = pause;

  // map ========================
  map = loadImage("map1.png");
  bg = loadImage("floor.jpg");
  floor = loadImage("floor1.jpg");

  //darkness =====================
  darkness = new ArrayList<Darkness>();
  lightlayer = new Darkness(1, 1, 3);

  //load enemies
  int y = 0, x = 0; 
  while (y < map.height) {
    color Rcolor = map.get(x, y);
    if (Rcolor == e) {
      for (int i = 0; i < 2; i++) 
        myObjects.add(new boom(x, y));
    }
    if (Rcolor == f) myObjects.add(new follower(x, y));
    if (Rcolor == t) {
      for (int i = 0; i < 4; i++) myObjects.add(new turret(x, y));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  //==================================================
  turret = loadImage("enemy/turret.png");
  fol1 = loadImage("enemy/f1.png");
  fol2 = loadImage("enemy/f2.png");


  // weapon ============================================
  shotgun = new images("2", shotgun_);
  fireball = new images("4", fireball_);
  fireball1 = new images("4", fireball1_);


  //fireball1, fireball2, pewpew, pistol
}

void draw() {

  //mode =======================
  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  } else {
    println("Error" + mode);
  }

  //button ========================
  bPressed();
}

void bPressed() {
  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
}

void keyPressed() { //reorganize 
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (key ==  ' ') space = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (key ==  ' ') space = false;
}
