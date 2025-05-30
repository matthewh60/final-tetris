class Block {
  private int[][] b;
  private String blockType;
  public Block(String type) {
    if (type.equals("J")) {
      b = new int[][] {{1, 0, 0}, {1, 1, 1}, {0, 0, 0}};
    }
    if (type.equals("L")) {
      b = new int[][] {{0, 0, 1}, {1, 1, 1}, {0, 0, 0}};
    }
    if (type.equals("S")) {
      b = new int[][] {{0, 1, 1}, {1, 1, 0}, {0, 0, 0}};
    }
    if (type.equals("T")) {
      b = new int[][] {{0, 1, 0}, {1, 1, 1}, {0, 0, 0}}; 
    }
    if (type.equals("Z")) {
      b = new int[][] {{1, 1, 0}, {0, 1, 1}, {0, 0, 0}};
    }
    if (type.equals("I")) {
      b = new int[][] {{0, 0, 0, 0}, {1, 1, 1, 1}, {0, 0, 0, 0}, {0, 0, 0, 0}};
    }
    if (type.equals("O")) {
      b = new int[][] {{1, 1}, {1, 1}};
    }
    blockType = type;
  }
  public int[][] getVectors() {
    return b;
  }
  public String getType() {
    return blockType;
  }
  public void rotateBlock() {
    if (!blockType.equals("I") && !blockType.equals("O")) {
      for (int i = 0; i < b.length; i++) {
        b[i].rotate(HALF_PI);
      }
    }
  }
}
