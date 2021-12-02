void pause() {
  background(dblue);
  g_l.show();


  texts("YOU HAVE "+ myPlayer.xp + " XP", 3*width/4, 100);
  texts("HP: "+ myPlayer.maxHP, 3*width/4, 280);
  texts("SPEED: "+ myPlayer.speed, 3*width/4, 340);
  texts("DAMAGE: "+ myPlayer.damage, 3*width/4, 400);
}


void texts(String a, int x, int y) {
  textSize(30);
  fill(white);
  text(a, x, y);
  fill(dpurple);
  text(a, x+2, y+2);
}
