class Grid {
  private int[][] cells;
  private int cols;
  private int rows;
  private color[] colors;
  private int cellSize;
  private boolean usedHold;
  public Grid(int rows, int cols, int cellSize) {
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    cells = new int[rows][cols];
    colors = new color[]{#000000, #00FFFF, #FFFF00, #800080, #00FF00, #FF0000, #0000FF, #FF7F00};
    usedHold = false;
  }
  public int getCols() {
    return cols;
  }
  public void drawGrid() {
    noFill();
    for (int r = 2; r < cells.length; r++) {
      for (int c = 0; c < cells[0].length; c++) {
        fill(colors[cells[r][c]]);
        square((1000 - cols * cellSize) / 2 + c * cellSize, (1000 - rows * cellSize) / 2 + 150 + r * cellSize, cellSize);
      }
    }
  }
  public void drawGridPosition(color c, PVector b) {
    stroke(#777777);
    fill(c);
    square((1000 - cols * cellSize) / 2 + b.x * cellSize, (1000 - rows * cellSize) / 2 + 150 + b.y * cellSize, cellSize);
  }
  public boolean isValidPosition(PVector[] b, PVector center) {
    for (int i = 0; i < b.length; i++) {
      float x = center.x + b[i].x;
      float y = center.y + b[i].y;
      if (x < 0 || x >= cols || y < 0 || y >= rows || cells[int(y)][int(x)] != 0) {
        return false;
      }
    }
    return true;
  }
  public void lock(Block b) {
    for (int i = 0; i < b.getVectors().length; i++) {
      PVector temp = PVector.add(b.getCenter(), b.getVectors()[i]);
      cells[int(temp.y)][int(temp.x)] = b.getColorType();
    }
    usedHold = false;
    int temp = clearLines();
    updateStats(temp);
  }
  public color[] getColors() {
    return colors;
  }
  public int[][] getCells() {
    return cells;
  }
  public void setUsedHold(boolean b) {
    usedHold = b;
  }
  public boolean getUsedHold() {
    return usedHold;
  }
  public boolean isFull(int[] arr) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == 0) {
        return false;
      }
    }
    return true;
  }
  public void updateStats(int lines) {
    if (lines == 1) {
      score += 40 * level;
    }
    if (lines == 2) {
      score += 100 * level;
    }
    if (lines == 3) {
      score += 300 * level;
    }
    if (lines == 4) {
      score += 1200 * level;
    }
    linesCleared += lines;
  }
  public void moveRowsDown(int startRow) {
    for (int i = startRow; i > 0; i--) {
      for (int j = 0; j < cells[0].length; j++) {
        cells[i][j] = cells[i - 1][j];
      }
    }
  }
  public int clearLines() {
    int result = 0;
    for (int i = 0; i < cells.length; i++) {
      if (isFull(cells[i])) {
        moveRowsDown(i);
        result++;
      }
    }
    return result;
  }
}
  
  
