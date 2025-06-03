class Grid {
  private int[][] cells;
  private int cols;
  private int rows;
  private color[] colors;
  private int cellSize;
  public Grid(int cols, int rows, int cellSize) {
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    cells = new int[rows][cols];
    colors = new color[] {color(0, 0, 0), #00FFFF, #FFFF00, #800080, #00FF00, #FF0000, #0000FF, #FF7F00};
  }
  
  
