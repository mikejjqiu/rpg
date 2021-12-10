void intro() {
  gi.show();
  buttoni.show();
  if (buttoni.clicked == true) mode = game;
  selection();
}



void selection() {
  Button h1, h2, h3;
  h1 = new Button(dgreen, hero1);
  //h2 = new Button(dgreen, hero2);
  h3 = new Button(dgreen, hero3);

  h1.show2(width/4, height/2, 100, 150);
  //h2.show2(width/2, height/2, 100, 150);
  h3.show2(3*width/4, height/2, 100, 150);
}
