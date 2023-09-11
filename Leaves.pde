class Leaves{
  float x_leaves, y_leaves;
  float speed, rotate, theta;
  color col;
   
Leaves(color colors) {
    x_leaves = random(-20, 1220);
    y_leaves = random(-350, -600);
    col = colors;
    speed = 1;
    theta = 0;
    rotate = random(-0.05, 0.05); 
  }
  
  
void move() {
    theta = theta + rotate;
    y_leaves = y_leaves + speed;
  }
  
void display() {
 fill(col);
 strokeWeight(1);
 stroke(0);
 if (y_leaves < -200) {
  pushMatrix();
  translate(x_leaves, y_leaves);
  rotate(theta);
  beginShape();
   curveVertex(x_leaves+50,  y_leaves+50);
   curveVertex(x_leaves+50,  y_leaves+50);
   curveVertex(x_leaves+25,  y_leaves+100);
   curveVertex(x_leaves+45,  y_leaves+120);
   curveVertex(x_leaves+45,  y_leaves+130);
   curveVertex(x_leaves+55,  y_leaves+130);
   curveVertex(x_leaves+55,  y_leaves+120);
   curveVertex(x_leaves+75,  y_leaves+100);
   curveVertex(x_leaves+50,  y_leaves+50);
   curveVertex(x_leaves+50,  y_leaves+50);
  endShape();
  popMatrix();
 }
}
}
