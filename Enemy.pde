class Enemy {
  float x, y, speed;
  int health;
  int currentSegment;

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    this.speed = 1.5;
    this.health = 3;
    this.currentSegment = 0;
  }

  void update(Path path) {
    if (currentSegment < path.segments.size() - 1) {
      PVector current = path.segments.get(currentSegment);
      PVector next = path.segments.get(currentSegment + 1);

      // Calcola le coordinate centrali dei segmenti
      float targetX = next.x + gridSize / 2;
      float targetY = next.y + gridSize / 2;

      // Direzione verso il prossimo segmento
      PVector direction = PVector.sub(new PVector(targetX, targetY), new PVector(x, y)).normalize();
      x += direction.x * speed;
      y += direction.y * speed;

      // Passa al prossimo segmento quando è vicino al target
      if (dist(x, y, targetX, targetY) < speed) {
        currentSegment++;
      }
    } else {
      // Fine del percorso: continua verso destra
      x += speed;
    }
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);

    fill(0);
    textAlign(CENTER);
    text(health, x, y - 15);
  }
}
