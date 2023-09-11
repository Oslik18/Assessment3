class Snow {
  float x_snow;
  float y_snow;
  float speed;
  float gravity;
  float extent;
  
  Snow() {
    x_snow = random(10, 1190);
    y_snow = random(-10, -50);
    extent = random(7, 20);
    speed = random(1, 8);
    gravity = 0.05;
  }
  
  void move() {
    speed = speed + gravity;
    y_snow = y_snow + speed;
  }
  
  void display() {
    fill(255);
    strokeWeight(1);
    stroke(0);
    if (y_snow < 890) {
    circle(x_snow, y_snow, extent);
    }
  }
}  
