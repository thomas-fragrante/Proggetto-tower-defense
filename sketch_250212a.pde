// Variabili globali
ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
Path path;
int gridSize = 40;
int lives = 10; // Numero iniziale di vite

void setup() {
  size(600, 400);
  enemies = new ArrayList<Enemy>();
  towers = new ArrayList<Tower>();
  path = new Path();
}

void draw() {
  if (lives <= 0) {
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    text("Game Over", width / 2, height / 2);
    noLoop(); // Ferma il gioco
    return;
  }

  background(102, 153, 0); // Verde chiaro per il prato
  drawGrid();
  path.display();

  // Visualizza la vita in alto a destra
  fill(255);
  textSize(20);
  textAlign(RIGHT, TOP);
  text("Vite: " + lives, width - 10, 10);

  // Spawning nemici
  if (frameCount % 60 == 0) {
    enemies.add(new Enemy(0, path.getStartY()));
  }

  // Aggiornamento nemici
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.update(path);
    e.display();

    // Controlla se il nemico ha raggiunto la fine del percorso
    if (e.x > width) {
      lives--; // Riduci la vita
      enemies.remove(i); // Rimuovi il nemico
    }

    if (e.health <= 0) {
      enemies.remove(i);
    }
  }

  // Torre spara
  for (Tower t : towers) {
    t.shoot(enemies);
    t.display();
  }
}

void drawGrid() {
  stroke(120, 170, 0); // Verde più scuro per i contorni della griglia
  for (int x = 0; x <= width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += gridSize) {
    line(0, y, width, y);
  }
}

void mousePressed() {
  int gridX = (mouseX / gridSize) * gridSize;
  int gridY = (mouseY / gridSize) * gridSize;

  // Controlla se già esiste una torre in quella posizione
  boolean occupied = false;
  for (Tower t : towers) {
    if (t.x == gridX && t.y == gridY) {
      occupied = true;
      break;
    }
  }

  if (!occupied) {
    towers.add(new Tower(gridX, gridY));
  }
}

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
    // Disegna i quadrati del percorso
    fill(102, 153, 0); // Verde medio per i quadrati del percorso
    noStroke();
    for (PVector p : segments) {
      rect(p.x, p.y, gridSize, gridSize);
    }
    
    // Disegna la linea del percorso
    stroke(139, 69, 19); // Marrone per il sentiero (Saddle Brown)
    strokeWeight(24);
    for (int i = 0; i < segments.size() - 1; i++) {
      PVector current = segments.get(i);
      PVector next = segments.get(i + 1);
      line(current.x + gridSize/2, current.y + gridSize/2, 
           next.x + gridSize/2, next.y + gridSize/2);
    }
    strokeWeight(1);
  }

  float getStartY() {
    return segments.get(0).y + gridSize / 2;
  }
}
