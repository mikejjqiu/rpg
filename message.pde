class message extends GameObject {

  //float y;

  message(PVector loc, String t) {
    //int tt = 255;
    //y = loc.y;
    textSize(50);
    fill(0);
    text(t, loc.x, loc.y);

    loc.y--;
    //tt--;
  }
}
