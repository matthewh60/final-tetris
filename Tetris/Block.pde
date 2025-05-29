class Block {
  private PVector[] b;
  private String blockType;
  private int descent;
  public Block(String type) {
    if (type.equals("J")) {
      blockType = type;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(-1, 0), new PVector(-1, -1)};
    }
    if (type.equals("L")) {
      blockType = type;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(-1, 0), new PVector(1, -1)};
    }
    if (type.equals("S")) {
      blockType = type;
      b = new PVector[]{new PVector(0, 0), new PVector(-1, 0), new PVector(0, -1), new PVector(1, -1)};
    }
    if (type.equals("T")) {
      blockType = type;
      b = new PVector[]{new PVector(0, 0), new PVector(-1, 0), new PVector(1, 0), new PVector(0, -1)};
    }
    if (type.equals("Z")) {
      blockType = type;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(0, -1), new PVector(-1, -1)};
    }
    if (type.equals("I")) {
      blockType = type;
      b = new PVector[]{new PVector(-2, 0), new PVector(-1, 0), new PVector(0, 0), new PVector(1, 0)};
    }
    if (type.equals("O")) {
      blockType = type;
      b = new PVector[]{new PVector(1, 0), new PVector(0, 0), new PVector(0, 1), new PVector(1, 1)};
    }
    descent = 0;
  }
  public PVector[] getVectors() {
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
  public int getDescent() {
    return descent;
  }
  public void descend() {
    descent++;
  }
}
