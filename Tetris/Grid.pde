class Grid {
  private int[][] cells;
  private int cols;
  private int rows;
  private color[] colors;
  private int cellSize;
  public Grid(int rows, int cols, int cellSize) {
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    cells = new int[rows][cols];
    colors = new color[] {color(0, 0, 0), #00FFFF, #FFFF00, #800080, #00FF00, #FF0000, #0000FF, #FF7F00};
    
  }
  public int getCols() {
    return cols;
  }
  public void drawGrid() {
    noFill();
    for (int r = 0; r < cells.length; r++) {
      for (int c = 0; c < cells[0].length; c++) {
        square((1000 - cols * cellSize) / 2 + c * cellSize, (1000 - cols * cellSize) / 2 + 20 + r * cellSize, cellSize);
      }
    }
  }
  public boolean isValidPosition(Block b) {
    for (int i = 0; i < b.getVectors().length; i++) {
      float x = b.getCenter().x / cellSize + b.getVectors()[i].x;
      float y = b.getCenter().y / cellSize + b.getVectors()[i].y;
      if (x < 0 || x >= cols || y < 0 || y >= rows || cells[int(y)][int(x)] != 0) {
        return false;
      }
    }
    return true;
  }
}
  
  
