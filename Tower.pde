class Tower {
  float x, y;
  float range; 
  float angle = 0;
  Enemy target = null;

  Tower(float x, float y, float range) {
    this.x = x;
    this.y = y;
    this.range = range;
  }

  boolean isMouseOver() {
    return mouseX >= x && mouseX <= x + gridSize && mouseY >= y && mouseY <= y + gridSize;
  }

  void shoot(ArrayList<Enemy> enemies) {
    // trova nemico piu vicino
    target = null;
    float closestDistance = range;
    for (Enemy e : enemies) {
      float d = dist(x + gridSize / 2, y + gridSize / 2, e.x, e.y);
      if (d < closestDistance) {
        closestDistance = d;
        target = e;
      }
    }

    // sparo
    if (target != null && frameCount % 30 == 0) {
      target.health--;
      angle = atan2(target.y - (y + gridSize / 2), target.x - (x + gridSize / 2));
    }
  }

  void display() {
    //disegno del range di attacco
    noFill();
    stroke(0, 150, 255, 50);
    strokeWeight(2);
    ellipse(x + gridSize / 2, y + gridSize / 2, range * 2, range * 2);

    // base della torre
    fill( 150, 75, 0);
    rect(x, y, gridSize, gridSize);

    //cannone
    fill(255, 0, 0);
    pushMatrix();
    translate(x + gridSize / 2, y + gridSize / 2);
    rotate(angle);
    rect(-5, -10, 10, 10); 
    popMatrix();
  }
}

class NormalTower extends Tower {
  NormalTower(float x, float y) {
    super(x, y, 100);
  }
  void display() {

    noFill();
    stroke(0, 150, 255, 50);
    strokeWeight(2);
    ellipse(x + gridSize / 2, y + gridSize / 2, range * 2, range * 2); 

    fill(0, 0, 255); 
    noStroke(); 
    ellipse(x + gridSize / 2, y + gridSize / 2, gridSize * 0.8, gridSize * 0.8); 
    

    pushMatrix();
    translate(x + gridSize / 2, y + gridSize / 2);
    rotate(angle);
    stroke(50, 50, 150); 
    strokeWeight(8);
    line(0, 0, gridSize * 0.6, 0);
    popMatrix();
  }
}

class FastTower extends Tower {
  FastTower(float x, float y) {
    super(x, y, 70);
  }

  void display() {

    noFill();
    stroke(0, 150, 255, 50); 
    strokeWeight(2);
    ellipse(x + gridSize / 2, y + gridSize / 2, range * 2, range * 2); 

    fill(255, 255, 0); 
    noStroke(); 
    ellipse(x + gridSize / 2, y + gridSize / 2, gridSize * 0.8, gridSize * 0.8);
    

    pushMatrix();
    translate(x + gridSize / 2, y + gridSize / 2);
    rotate(angle);
    stroke(50, 50, 150);
    strokeWeight(8);
    line(0, 0, gridSize * 0.6, 0);
    popMatrix();
  }
}

class LongRangeTower extends Tower {
  LongRangeTower(float x, float y) {
    super(x, y, 150);
  }

  void display() {

    noFill();
    stroke(0, 150, 255, 50);
    strokeWeight(2);
    ellipse(x + gridSize / 2, y + gridSize / 2, range * 2, range * 2);

    fill(0, 100, 0);
    noStroke(); 
    ellipse(x + gridSize / 2, y + gridSize / 2, gridSize * 0.8, gridSize * 0.8); 
    

    pushMatrix();
    translate(x + gridSize / 2, y + gridSize / 2);
    rotate(angle);
    stroke(50, 50, 150); 
    strokeWeight(8);
    line(0, 0, gridSize * 0.6, 0);
    popMatrix();
  }
}
