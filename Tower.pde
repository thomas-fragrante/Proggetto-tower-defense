class Tower {
  float x, y;
  float range = 100; // Area di attacco
  float angle = 0; // Angolo di rotazione del cannone
  Enemy target = null; // Nemico attualmente preso di mira

  Tower(float x, float y) {
    this.x = x;
    this.y = y;
  }

  // Verifica se il mouse è sopra la torretta
  boolean isMouseOver() {
    return mouseX >= x && mouseX <= x + gridSize && 
           mouseY >= y && mouseY <= y + gridSize;
  }

  void shoot(ArrayList<Enemy> enemies) {
    // Trova il nemico più vicino
    target = null;
    float closestDistance = range;
    for (Enemy e : enemies) {
      float d = dist(x + gridSize / 2, y + gridSize / 2, e.x, e.y);
      if (d < closestDistance) {
        closestDistance = d;
        target = e;
      }
    }

    // Se c'è un nemico nel raggio, spara
    if (target != null && frameCount % 30 == 0) {
      target.health--;
      // Calcola l'angolo verso il nemico
      angle = atan2(target.y - (y + gridSize / 2), target.x - (x + gridSize / 2));
    }
  }

  void display() {
    // Disegna l'area di attacco (cerchio semi-trasparente) solo se il mouse è sopra la torretta
    if (isMouseOver()) {
      noFill();
      stroke(0, 150, 255, 50);
      strokeWeight(2);
      ellipse(x + gridSize / 2, y + gridSize / 2, range * 2, range * 2);
    }

    // Base della torretta (cerchio)
    fill(100, 100, 200); // Colore blu medio
    noStroke();
    ellipse(x + gridSize / 2, y + gridSize / 2, gridSize * 0.8, gridSize * 0.8);

    // Cannone (linea ruotata)
    pushMatrix();
    translate(x + gridSize / 2, y + gridSize / 2); // Sposta l'origine al centro della torretta
    rotate(angle); // Ruota il cannone
    stroke(50, 50, 150); // Colore blu scuro
    strokeWeight(8);
    line(0, 0, gridSize * 0.6, 0); // Disegna il cannone
    popMatrix();
  }
}
