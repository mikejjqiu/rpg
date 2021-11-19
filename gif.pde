class gif {
  int numframe;
  int currFrame;
  PImage[] g;
  PVector loc;
  int x, y, w, h, s;

  gif(int frames, String a, String b, int x1, int y1, int w1, int h1, int s1) {
    numframe = frames;
    g = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      g[i] = loadImage(a + "frame_" + i + b);
    }
    w = w1;
    h = h1;
    x = x1;
    y = y1;
    s = s1;
  }
  void show() {
    image(g[currFrame], x, y, w, h);
    if (frameCount % s == 0) {
      currFrame++;
    }
    if (currFrame == numframe) {
      currFrame = 0;
    }
  }
}
