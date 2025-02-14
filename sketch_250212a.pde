// Global variables
ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
Path path;
int gridSize = 40;
int lives = 10; // vita
int coins = 100; // monete
int normalTowerCost = 50; // costi delle torri
int fastTowerCost = 30;  
int longRangeTowerCost = 70; 
int selectedTowerType = 0;

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
    noLoop(); 
    return;
  }

  background(102, 153, 0); 
  drawGrid();
  path.display();

  fill(255);
  textSize(20);
  textAlign(RIGHT, TOP);
  text("Lives: " + lives, width - 10, 10);

  textAlign(LEFT, TOP);
  text("Coins: " + coins, 10, 10);

//spawn nemici
  if (frameCount % 60 == 0) {
    int type = int(random(3));
    if (type == 0) {
      enemies.add(new Enemy(0, path.getStartY(), 1)); 
    } else if (type == 1) {
      enemies.add(new FastEnemy(0, path.getStartY(), 2)); 
    } else {
      enemies.add(new TankEnemy(0, path.getStartY(), 3)); 
    }
  }

  // Update nemici
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.update(path);
    e.display();

    // controllo danno al giocatore
    if (e.x > width) {
      lives--; 
      enemies.remove(i);
    }

    // controllo morte nemici
    if (e.health <= 0) {
      coins += e.coins; 
      enemies.remove(i); 
    }
  }


  for (Tower t : towers) {
    t.shoot(enemies);
    t.display();
  }
}

void drawGrid() { //griglia di gioco
  stroke(120, 170, 0); 
  for (int x = 0; x <= width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += gridSize) {
    line(0, y, width, y);
  }
}

void keyPressed() {
  if (key == '1') {
    selectedTowerType = 0; // torre normale
  } else if (key == '2') {
    selectedTowerType = 1; // torre veloce
  } else if (key == '3') {
    selectedTowerType = 2; // torre cecchino
  }
}

void mousePressed() {
  int gridX = (mouseX / gridSize) * gridSize;
  int gridY = (mouseY / gridSize) * gridSize;

  // controlla se il clic è sulla path
  boolean onPath = false;
  for (PVector p : path.segments) {
    if (p.x == gridX && p.y == gridY) {
      onPath = true;
      break;
    }
  }

  // se non è sulla path
  if (!onPath) {
    // controlla se c e gia una torre
    boolean occupied = false;
    for (Tower t : towers) {
      if (t.x == gridX && t.y == gridY) {
        occupied = true;
        break;
      }
    }

    if (!occupied) {
      Tower newTower = null;
      if (selectedTowerType == 0) { 
        if (coins >= normalTowerCost) {
          newTower = new NormalTower(gridX, gridY);
          coins -= normalTowerCost;
        }
      } else if (selectedTowerType == 1) {
        if (coins >= fastTowerCost) {
          newTower = new FastTower(gridX, gridY);
          coins -= fastTowerCost; 
        }
      } else if (selectedTowerType == 2) { 
        if (coins >= longRangeTowerCost) {
          newTower = new LongRangeTower(gridX, gridY);
          coins -= longRangeTowerCost; 
        }
      }

      if (newTower != null) {
        towers.add(newTower);
      }
    }
  }
}
