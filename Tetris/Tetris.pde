import java.util.Queue;
private int score;
private int combo;
private int level;
private int linesCleared;
private Block currentBlock;
private String[] blockPool;
private Queue<Block> nextBlocks;
private Queue<Block> hold;
private int blockSize;
private Grid g;
void setup() {
  size(1000, 1200);
  background(0);
  currentBlock = new Block("I", 0, 0);
  blockSize = 40;
  frameRate(60);
  g = new Grid(20, 10, blockSize);
}
void draw() {
  background(0);
  g.drawGrid();
  drawCurrentBlock(currentBlock);
  if (frameCount % 45 == 0) {
    descendCurrentBlock(currentBlock);
  }
}
public void drawCurrentBlock(Block current) {
  fill(0, 0, 255);
  stroke(255, 255, 255);
  for (int i = 0; i < current.getVectors().length; i++) {
    int x = (int(current.getCenter().x + current.getVectors()[i].x) + (1000 - g.getCols() * blockSize) / (2 * blockSize)) * blockSize;
    int y = int(current.getCenter().x + current.getVectors()[i].x) * blockSize;
    square(x, y, blockSize);
  }
}
public void descendCurrentBlock(Block c) {
  c.getCenter().add(0, blockSize);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      currentBlock.rotateBlock();
    }
  }
}
