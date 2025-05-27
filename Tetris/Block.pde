class Block {
<<<<<<< HEAD
  private PVector[] b;
  private String blockType;
  public Block(String type) {
    if (type.equals("J")) {
      b = new PVector[]{new PVector(0, 0), new PVector(0, 1), new PVector(0, -1), new PVector(-1, 1)};
    }
  }
  public void rotateBlock() {
    for (int i = 0; i < b.length; i++) {
      b[i].rotate(HALF_PI);
    }
  }
=======
  private String blockType;
  private PVector[] b;
  public Block(String type) {
    b = new PVector[4];
  }
  public void rotate() {
  }
  
>>>>>>> 83a8a40821f4575fb6cf191f51897a248d99d098
}
