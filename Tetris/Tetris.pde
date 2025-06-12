import java.util.Queue;
import java.util.LinkedList;
private int score;
private int level;
private int linesCleared;
private Block currentBlock;
private String[] blockPool;
private LinkedList<Block> next;
private String hold;
private int blockSize;
private Grid g;
private int gravityTimer;
private boolean gameOver;
void setup() {
  size(1000, 1200);
  background(0);
  blockPool = new String[]{"J", "L", "S", "T", "Z", "I", "O"};
  currentBlock = new Block(blockPool[int(random(0, 7))], 4, 1);
  next = new LinkedList<Block>();
  next.add(new Block(blockPool[int(random(0, 7))], 4, 1));
  blockSize = 40;
  frameRate(60);
  hold = null;
  gravityTimer = 0;
  level = 1;
  score = 0;
  linesCleared = 0;
  gameOver = false;
  g = new Grid(22, 10, blockSize);
}
public void restart() {
  blockPool = new String[]{"J", "L", "S", "T", "Z", "I", "O"};
  currentBlock = new Block(blockPool[int(random(0, 7))], 4, 1);
  next = new LinkedList<Block>();
  next.add(new Block(blockPool[int(random(0, 7))], 4, 1));
  blockSize = 40;
  frameRate(60);
  hold = null;
  gravityTimer = 0;
  level = 1;
  score = 0;
  linesCleared = 0;
  gameOver = false;
  g = new Grid(22, 10, blockSize);
}
void draw() {
  if (gameOver) {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(64);
    text("GAME OVER!", width / 2, height / 2);
    textSize(32);
    fill(255);
    text("Score: " + score, width / 2, height / 2 + 80);
    text("[R] Restart", width / 2, height / 2 + 160);
    return;
  }
  background(0);
  g.drawGrid();
  drawCurrentBlock(currentBlock);
  level = linesCleared / 10 + 1;
  if (gravityTimer == (45 - (level - 1) * 2)) {
    if (!currentBlock.descend(g)) {
      g.lock(currentBlock);
      currentBlock = next.poll();
      next.add(new Block(blockPool[int(random(0, 7))], 4, 1));
      if (!g.isValidPosition(currentBlock.getVectors(), currentBlock.getCenter())) {
        gameOver = true;
      }
    }
    gravityTimer = 0;
  }
  displayStats();
  if (hold != null) {
    Block holdBlock = new Block(hold, 0, 0);
    int x = 215;
    int y = 345;
    if (hold.equals("I")) {
      x = 205;
      y = 335;
    }
    if (hold.equals("O")) {
      x = 207;
      y = 325;
    }
    drawSmall(holdBlock, x, y, 20);
  }
  drawNext();
  noFill();
  square(175, 290, 100);
  square(725, 290, 100);
  gravityTimer++;
}
public void drawCurrentBlock(Block current) {
  fill(0, 0, 255);
  stroke(255, 255, 255);
  for (int i = 0; i < current.getVectors().length; i++) {
    g.drawGridPosition(g.getColors()[currentBlock.getColorType()], current.getGridPositions()[i]);
  }
}
public void drawSmall(Block b, int x, int y, int size) {
  fill(g.getColors()[b.getColorType()]);
  stroke(#777777);
  for (int i = 0; i < b.getVectors().length; i++) {
    square(x + int(b.getCenter().x + b.getVectors()[i].x) * size, y + int(b.getCenter().y + b.getVectors()[i].y) * size, size);
  }
}
public void drawNext() {
  if (next.get(0) != null) {
    int x = 685;
    int y = 325;
    if (next.get(0).getType().equals("I")) {
      x = 675;
      y = 315;
    }
    if (next.get(0).getType().equals("O")) {
      x = 677;
      y = 305;
    }
    drawSmall(next.get(0), x, y, 20);
  }
}
public void swapHold() {
  if (hold != null) {
    String temp = hold;
    hold = currentBlock.getType();
    currentBlock = new Block(temp, 4, 1);
  }
  else {
    hold = currentBlock.getType();
    currentBlock = next.poll();
    next.add(new Block(blockPool[int(random(0, 7))], 4, 1));
    if (!g.isValidPosition(currentBlock.getVectors(), currentBlock.getCenter())) {
      gameOver = true;
    }
    gravityTimer = 0;
  }
  g.setUsedHold(true);
}
public void displayStats() {
  textSize(42);
  textAlign(RIGHT);
  fill(255, 255, 255);
  text(linesCleared, 280, 1085);
  text(level, 280, 975);
  textSize(24);
  text("LEVEL", 280, 1040);
  text("LINES", 280, 930);
  textSize(42);
  textAlign(LEFT);
  text(score, 720, 1085);
  textSize(24);
  text("SCORE", 720, 1040);
}
void keyPressed() {
  if (gameOver) {
    if (key == 'r' || key == 'R') {
      restart();
    }
    return;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      currentBlock.rotateBlock(g);
      gravityTimer = 0;
    }
    if (keyCode == RIGHT) {
      currentBlock.move(g, new PVector(1, 0));
    }
    if (keyCode == LEFT) {
      currentBlock.move(g, new PVector(-1, 0));
    }
    if (keyCode == DOWN) {
      currentBlock.descend(g);
    }
  }
  if (key == ' ') {
    currentBlock.hardDrop(g);
    currentBlock = next.poll();
    next.add(new Block(blockPool[int(random(0, 7))], 4, 1));
    if (!g.isValidPosition(currentBlock.getVectors(), currentBlock.getCenter())) {
      gameOver = true;
    }
    gravityTimer = 0;
  }
  if (key == 'c') {
    if (!g.getUsedHold()) {
      swapHold();
      gravityTimer = 0;
    }
  }
}
