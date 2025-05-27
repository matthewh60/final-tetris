class Block {
  private PVector[] b;
  public Block(String type) {
    if (type.equals("J")) {
      b = new PVector[]{new PVector(0, 0), new PVector(0, 1), new PVector(0, -1), new PVector(-1, 1)};
    }
  }
  public PVector[] getVectors() {
    return b;
  }
  public void rotateBlock() {
    for (int i = 0; i < b.length; i++) {
      b[i].rotate(HALF_PI);
    }
  }
}
