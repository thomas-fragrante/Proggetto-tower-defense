class Enemy {
  float x, y, speed;
  int health;
  int currentSegment;
  int coins;

  Enemy(float x, float y, int coins) {
    this.x = x;
    this.y = y;
    this.speed = 1.5;
    this.health = 3;
    this.currentSegment = 0;
    this.coins = coins;
  }

  void update(Path path) {
    if (currentSegment < path.segments.size() - 1) {
      PVector current = path.segments.get(currentSegment);
      PVector next = path.segments.get(currentSegment + 1);


      float targetX = next.x + gridSize / 2;
      float targetY = next.y + gridSize / 2;

      // Direzione del prossimo segmento
      PVector direction = PVector.sub(new PVector(targetX, targetY), new PVector(x, y)).normalize();
      x += direction.x * speed;
      y += direction.y * speed;

      if (dist(x, y, targetX, targetY) < speed) {
        currentSegment++;
      }
    } else {
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

class FastEnemy extends Enemy {
  FastEnemy(float x, float y, int coins) {
    super(x, y, coins);
    this.speed = 2.5;
    this.health = 2;
  }

  void display() {
    fill(0, 255, 0);
    ellipse(x, y, 15, 15);
    fill(0);
    textAlign(CENTER);
    text(health, x, y - 15);
  }
}

class TankEnemy extends Enemy {
  TankEnemy(float x, float y, int coins) {
    super(x, y, coins);
    this.speed = 0.8;
    this.health = 6;
  }

  void display() {
    fill(0, 0, 255);
    ellipse(x, y, 30, 30);
    fill(255);
    textAlign(CENTER);
    text(health, x, y - 15);
  }
}
