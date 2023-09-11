class Rain {
 float x_rain;
 float y_rain;
 float speed;
 float gravity;
 float extent;

 Rain() {
    x_rain = random(50, 1400);
    y_rain = random(-10, -50);
    extent = random(7, 20);
    speed = random(1, 6);
    gravity = 0.05;
  }
  
  void move() {
    speed = speed + gravity;
    y_rain = y_rain + speed;
    x_rain = x_rain-2.5;
  }
  
  void display() {
    stroke(#0597c1);
    strokeWeight(8);
    if (y_rain < 880) {
    line(x_rain, y_rain, x_rain-5, y_rain+12);
    }
  }
  
  
  
}
