class Butterflies {
  float x_but;
  float y_but;
  float speed;
  color color1, color2;
  float gravity;
  float extent;
  
  Butterflies() {
    x_but = random(10, 1190);
    y_but = random(980, 850);
    extent = random(7, 20);
    speed = random(2, 5);
    gravity = 0.02;
    color1 = color(random(0, 255), 220, 50);
    color2 = color(150, 50, random(0, 255));
  }
  
  void move(int x) {
    speed = speed + gravity;
    y_but = y_but - speed + random(-2, 2);
    x_but = x_but + x + random(-5, 5);
  }
  
  void display() {
    stroke(0);
    if (y_but > -50) {
    beginShape();
      strokeWeight(1);
      fill(color1);      
      circle(x_but-8, y_but+19, 11);
      circle(x_but+8, y_but+19, 11);
      fill(color2);
      circle(x_but-9, y_but+7, 15);
      circle(x_but+9, y_but+7, 15);
      fill(0);
      strokeWeight(6);
      line(x_but, y_but, x_but, y_but+23);
    endShape();
    }
  }
}  
