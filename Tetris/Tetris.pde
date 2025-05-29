import java.util.Queue;
private int score;
private int combo;
private Block currentBlock;
private String[] blockPool;
private Queue<Block> nextBlocks;
private Queue<Block> hold;
private int blockSize;
void setup() {
  size(1000, 1000);
  background(0, 0, 0);
  currentBlock = new Block("J");
  blockSize = 50;
}
void draw() {
  background(0, 0, 0);
  drawCurrentBlock(currentBlock);
}
public void drawCurrentBlock(Block current) {
  fill(0, 0, 255);
  stroke(255, 255, 255);
  for (int i = 0; i < current.getVectors().length; i++) {
    square(width/2 + current.getVectors()[i].x * blockSize, height/2 + current.getVectors()[i].y * blockSize, blockSize);
  }
}
public void descendCurrentBlock(Block c) {
  for (int i = 0; i < c.getVectors().length; i++) {
    c.getVectors()[i].set(c.getVectors()[i].x + 0, c.getVectors()[i].y + c.getDescent());
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      currentBlock.rotateBlock();
    }
  }
}
