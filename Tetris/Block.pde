class Block {
  private PVector[] b;
  private String blockType;
  private int descent;
  private PVector center;
  private int state;
  public Block(String type, int centerX, int centerY) {
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
    state = 1;
    descent = 0;
    center = new PVector(centerX, centerY);
  }
  public PVector[] getVectors() {
    return b;
  }
  public String getType() {
    return blockType;
  }
  
  public PVector getCenter() {
    return center;
  }
  public PVector[] getRotatedVectors() {
    PVector[] result = new PVector[b.length];
    for (int i = 0; i < b.length; i++) {
      result[i] = new PVector(b[i].y * -1, b[i].x);
    }
    return result;
  }
   
  
  public void rotateBlock(Block b) {
    
  }
  public int getDescent() {
    return descent;
  }
  public void descend() {
    descent++;
  }
}
