class Path {
  ArrayList<PVector> segments;

  Path() {
    segments = new ArrayList<PVector>();
    generatePath();
  }

  void generatePath() {
    segments.clear();
    int x = 0;
    int y = (int) (random(height / gridSize)) * gridSize;
    segments.add(new PVector(x, y));

    int lastDirection = 0;

    while (x < width) {
      int direction;
      do {
        direction = (int) random(3);
      } while ((lastDirection == 1 && direction == 2) || (lastDirection == 2 && direction == 1));

      if (direction == 0) {
        x += gridSize;
      } else if (direction == 1 && y > 0) {
        y -= gridSize;
      } else if (direction == 2 && y < height - gridSize) {
        y += gridSize;
      }

      segments.add(new PVector(x, y));
      lastDirection = direction;
    }
  }

  void display() {
    //disegna path
    fill(102, 153, 0); 
    noStroke();
    for (PVector p : segments) {
      rect(p.x, p.y, gridSize, gridSize);
    }

    stroke(139, 69, 19);
    strokeWeight(24);
    for (int i = 0; i < segments.size() - 1; i++) {
      PVector current = segments.get(i);
      PVector next = segments.get(i + 1);
      line(current.x + gridSize / 2, current.y + gridSize / 2, next.x + gridSize / 2, next.y + gridSize / 2);
    }
    strokeWeight(1);
  }

  float getStartY() {
    return segments.get(0).y + gridSize / 2;
  }
}
