import java.util.Queue;
private int score;
private Block j;
void setup() {
  size(1000, 1000);
  background(0, 0, 0);
}
void draw() {
  background(0, 0, 0);
  drawCurrentBlock(j);
}
public void rotateCurrentBlock(Block b) {
  for (int i = 0; i < b.getVectors().length; i++) {
    b.getVectors()[i].rotate(HALF_PI);
  }
}
public void drawCurrentBlock(Block b) {
  for (int i = 0; i < b.getVectors().length; i++) {
    square(width/2 + b.getVectors()[i].x, height/2 + b.getVectors()[i].y, 200);
  }
}
