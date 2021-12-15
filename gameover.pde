

void gameover() {

  if (myPlayer.hp<=0) {
    tint(100, 0, 0); 
    text("Y O U  F A I L E D", width/2, height/2);
  }
  image(go, width/2, height/2, width, height);
}
