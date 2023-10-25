ArrayList<PVector> snake = new ArrayList<PVector>();
PVector pos;

PVector food;

PVector dir = new PVector(0, 0);
PVector dir2 = new PVector(0,-.05);
PVector dir3 = new PVector(.05, 0);
PVector dir4 = new PVector(0,.05);
PVector dir5 = new PVector(-.05, 0);
int size = 40;
int w, h;

int spd = 1;
int len = 1;

void setup() {
  size(720, 720);
  w = width/size;
  h = height/size;
  
  pos = new PVector(w/2, h/2);
  food = new PVector(int(random(w)), int(random(h)));
  
  noStroke();
  fill(0);
}

void draw() {
  background(0);
  drawSnake();
  drawFood();
  
  if(frameCount % spd == 0) {
    updateSnake();   
  }
}

void drawFood() {
  fill(255, 255, 0);
  circle(food.x * size, food.y * size, 20);
}

void newFood() {
  food = new PVector(int(random(w)), int(random(h)));
}

void drawSnake() {
  fill(255);
  circle(pos.x * size, pos.y * size, size);
  for(int i = 0; i < snake.size(); i ++) {
    rect(snake.get(i).x * size, snake.get(i).y * size, size, size);
  }
}

void updateSnake() {
  
  while(snake.size() > len) {
    snake.remove(0);
  }
  pos.add(dir);
    
  
  if(pos.x < food.x +.5 && pos.x > food.x -.5 && pos.y < food.y +.5 && pos.y > food.y -.5) {
    newFood();
    len += 1;
  }  
  

  
  if(pos.x < .5) { reset();}
  if(pos.x > w -.5) { reset();}
  if(pos.y < .5) { reset();}
  if(pos.y > h-.5) { reset();}
}

void reset() {
  spd = 1;
  len = 2;
  pos = new PVector(w/2, h/2);
  dir = new PVector(0, 0);
  newFood();
  snake = new ArrayList<PVector>();
}

void keyPressed() { {
    if(key == ' ') { dir = dir2; }
    if(key == ' ') { dir2 = dir3; }
    if(key == ' ') { dir3 = dir4; }
    if(key == ' ') { dir4 = dir5; }
    if(key == ' ') { dir5 = dir; }
  }
}
