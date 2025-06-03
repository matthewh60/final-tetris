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
void setup() {
  size(1000, 1000);
  background(0, 0, 0);
  currentBlock = new Block("I", 0, 0);
  blockSize = 50;
  frameRate(60);
}
void draw() {
  background(0, 0, 0);
  drawCurrentBlock(currentBlock);
  if (frameCount % 45 == 0) {
    descendCurrentBlock(currentBlock);
  }
}
public void drawCurrentBlock(Block current) {
  fill(0, 0, 255);
  stroke(255, 255, 255);
  for (int i = 0; i < current.getVectors().length; i++) {
    square(width/2 + current.getCenter().x + current.getVectors()[i].x * blockSize, height/2 + current.getCenter().y + current.getVectors()[i].y * blockSize, blockSize);
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
