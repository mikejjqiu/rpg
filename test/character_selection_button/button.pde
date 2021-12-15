class button {

  boolean interact, clicked, selected;
  float x, y, s;
  color normal, highlight;

  button(color n, color s) {
    normal = n;
    highlight = s;
    interact = selected = clicked = false;
  }

  show(float x, float y, float s) {
    if (mouseX > x - s/2 && mouseX < x + s/2 && mouseY > y - s/2 && mouseY < y + s/2) {
      interact = true;
      if (mousePressed) clicked = selected = true;
    } else {
     if (mousePressed) selected = false; 
    }
    
    if (interact || clicked || selected) fill(highlight);
    else fill(normal);
    
    rect(x, y, s, 1.5*s, 30);
  }
}
