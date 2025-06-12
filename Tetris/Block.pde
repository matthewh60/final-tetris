class Block {
  private PVector[] b;
  private String blockType;
  private int colorType;
  private PVector center;
  private PVector[][] kicks;
  private int state;
  public Block(String type, int centerX, int centerY) {
    if (type.equals("J")) {
      blockType = type;
      colorType = 6;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(-1, 0), new PVector(-1, -1)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, -2), new PVector(1, -2)},
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(-1, 0), new PVector(-1, 1), new PVector(0, -2), new PVector(-1, -2)},
      };
    }
    if (type.equals("L")) {
      blockType = type;
      colorType = 7;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(-1, 0), new PVector(1, -1)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, -2), new PVector(1, -2)},
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(-1, 0), new PVector(-1, 1), new PVector(0, -2), new PVector(-1, -2)},
      };
    }
    if (type.equals("S")) {
      blockType = type;
      colorType = 4;
      b = new PVector[]{new PVector(0, 0), new PVector(-1, 0), new PVector(0, -1), new PVector(1, -1)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, -2), new PVector(1, -2)},
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(-1, 0), new PVector(-1, 1), new PVector(0, -2), new PVector(-1, -2)},
      };
    }
    if (type.equals("T")) {
      blockType = type;
      colorType = 3;
      b = new PVector[]{new PVector(0, 0), new PVector(-1, 0), new PVector(1, 0), new PVector(0, -1)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, -2), new PVector(1, -2)},
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(-1, 0), new PVector(-1, 1), new PVector(0, -2), new PVector(-1, -2)},
      };
    }
    if (type.equals("Z")) {
      blockType = type;
      colorType = 5;
      b = new PVector[]{new PVector(0, 0), new PVector(1, 0), new PVector(0, -1), new PVector(-1, -1)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, -2), new PVector(1, -2)},
        {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0)},
        {new PVector(0, 0), new PVector(-1, 0), new PVector(-1, 1), new PVector(0, -2), new PVector(-1, -2)},
      };
    }
    if (type.equals("I")) {
      blockType = type;
      colorType = 1;
      b = new PVector[]{new PVector(-1, 0), new PVector(0, 0), new PVector(2, 0), new PVector(1, 0)};
      kicks = new PVector[][]{
        {new PVector(0, 0), new PVector(-1, 0), new PVector(2, 0), new PVector(-1, 0), new PVector(2, 0)}, 
        {new PVector(-1, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 1), new PVector(0, 2)}, 
        {new PVector(-1, -1), new PVector(1, -1), new PVector(-2, -1), new PVector(1, 0), new PVector(-2, 0)},
        {new PVector(0, -1), new PVector(0, -1), new PVector(0, -1), new PVector(0, 1), new PVector(0, -2)},
      };
    }
    if (type.equals("O")) {
      blockType = type;
      colorType = 2;
      b = new PVector[]{new PVector(1, 0), new PVector(0, 0), new PVector(0, 1), new PVector(1, 1)};
    }
    state = 0;
    center = new PVector(centerX, centerY);
  }
  public PVector[] getVectors() {
    return b;
  }
  public String getType() {
    return blockType;
  }
  public int getColorType() {
    return colorType;
  }
  public PVector[] getRotatedVectors() {
    PVector[] result = new PVector[b.length];
    for (int i = 0; i < b.length; i++) {
      result[i] = new PVector(b[i].y * -1, b[i].x);
    }
    return result;
  }
  public PVector getCenter() {
    return center;
  }
  public int getState() {
    return state;
  }
  public PVector[] getGridPositions() {
    PVector[] result = new PVector[b.length];
    for (int i = 0 ; i < b.length; i++) {
      PVector temp = PVector.add(center, b[i]);
      result[i] = temp;
    }
    return result;
  }
  public void rotateBlock(Grid g) {
    if (!blockType.equals("O")) {
      PVector[] test = this.getRotatedVectors();
      for (int i = 0; i < kicks[0].length; i++) {
        PVector offset = PVector.sub(kicks[state][i], kicks[getNextState()][i]);
        PVector newCenter = PVector.add(center, offset);
        if (g.isValidPosition(test, newCenter)) {
          state = getNextState();
          b = test;
          center = newCenter;
          return;
        }
      }
    }
  }
  public int getNextState() {
    return (state + 1) % 4;
  }
  public boolean move(Grid g, PVector dir) {
    PVector temp = PVector.add(center, dir);
    if (g.isValidPosition(b, temp)) {
      center = temp;
      return true;
    }
    return false;
  }
  public boolean descend(Grid g) {
    return move(g, new PVector(0, 1));
  }
  public void hardDrop(Grid g) {
    PVector temp = PVector.add(center, new PVector(0, 1));
    while (g.isValidPosition(b, temp)) {
      center = temp;
      temp = PVector.add(center, new PVector(0, 1));
    }
    g.lock(this);
  }
}
