PImage pic_autumn, pic_winter, pic_spring, pic_summer;
import java.util.Arrays;
import controlP5.*;
import processing.sound.*;

ControlP5 gui;

ArrayList<Snow> snowflakes;
ArrayList<Leaves> leaves;
ArrayList<Rain> rain;
ArrayList<Butterflies> butterflies;
int mode = 0;
int cnt_click = 0;
float x, y;
int[] speed_mouse = new int[20];
int[] speed_line = new int[20];
int[] dots = new int[20];
int count = 0;
color c1 = #d96906;
color c2 = #a7050a;
color c3 = #037639;
SoundFile audio_snow, audio_rain, audio_but, audio_leaf;
  

void setup() {
size(1200, 970);
gui = new ControlP5(this);
gui.addButton("refresh")
    .setLabel("Refresh")
    .setPosition(0, 915)
    .setSize(50, 40);
    


pic_winter = loadImage("Winter.jpg");
pic_spring = loadImage("Spring.jpg");
pic_summer = loadImage("Summer.jpg");
pic_autumn = loadImage("Autumn.jpg");

audio_snow = new SoundFile(this, "snow-running.wav");
audio_snow.loop();
audio_rain = new SoundFile(this, "RainFallMedium.wav");
audio_rain.loop();
audio_but = new SoundFile(this, "Butterfly.wav");
audio_but.loop();
audio_leaf = new SoundFile(this, "WindHeavy.wav");
audio_leaf.loop();

snowflakes = new ArrayList<Snow>();
leaves = new ArrayList<Leaves>();
rain = new ArrayList<Rain>();
butterflies = new ArrayList<Butterflies>();

}


void draw() {
background(#95cbfc);
fill(0);
textSize(24);
text("Press RIGHT mouse button ~20 times", 70, 940);
strokeWeight(1);
line(460, 935, 1160, 935);

for (int k = 0; k < dots.length; k++) {
  strokeWeight(1);
  stroke(0);
  fill(#4b50fa);
  circle(dots[k], 935, 10);
}

if (mode == 0) {
  image(pic_winter, 0, 0, 600, 450);
  image(pic_spring, 600, 0, 600, 450);
  image(pic_summer, 0, 450, 600, 450);
  image(pic_autumn, 600, 450, 600, 450);
  audio_snow.amp(0.001);
  audio_rain.amp(0.001);
  audio_leaf.amp(0.001);
  audio_but.amp(0.001);
  fill(0);
  textSize(24);
  text("Snow: ", 20, 40);
  text("Rain: ", 620, 40);
  text("Butterflies: ", 20, 490);
  text("Leaves: ", 620, 490);
  gui.setVisible(true);
}
  
//winter with snowing   
if (mode == 1) {
  gui.setVisible(false);
  audio_snow.amp(0.9);
  for (int j = 0; j < 20; j++) {
    if (count == speed_line[j] || count-1 == speed_line[j] || count-2 == speed_line[j] || 
      count-3 == speed_line[j] || count-4 == speed_line[j] || count-5 == speed_line[j] ||
      count-6 == speed_line[j] || count-7 == speed_line[j] || count-8 == speed_line[j] ||
      count-9 == speed_line[j] || count-10 == speed_line[j]){
      snowflakes.add(new Snow());
      break;
    }
  }
  pic_winter.resize(1200, 900);
  image(pic_winter, 0, 0);
  for (int i = snowflakes.size()-1; i >= 0; i--) { 
    Snow snowflake = snowflakes.get(i);
    snowflake.move();
    snowflake.display();
  } 
    count++;
}

//spring with raining 
if (mode == 2) {
  audio_rain.amp(0.9);
  gui.setVisible(false);
  for (int j = 0; j < 20; j++) {
    if (count == speed_line[j] || count-1 == speed_line[j] || count-2 == speed_line[j] || 
      count-3 == speed_line[j] || count-4 == speed_line[j] || count-5 == speed_line[j] ||
      count-6 == speed_line[j] || count-7 == speed_line[j] || count-8 == speed_line[j] ||
      count-9 == speed_line[j] || count-10 == speed_line[j]){
      rain.add(new Rain());
      break;
    }
  }
  pic_spring.resize(1200, 900);
  image(pic_spring, 0, 0);
  for (int i = rain.size()-1; i >= 0; i--) { 
    Rain drop = rain.get(i);
    drop.move();
    drop.display();
  } 
    count++;
}

//summer with flying betterflies  
if (mode == 3) {
    audio_but.amp(0.9);
    gui.setVisible(false);
  for (int j = 0; j < 20; j++) {
    if (count == speed_line[j] || count-1 == speed_line[j] || count-2 == speed_line[j] || 
      count-3 == speed_line[j] || count-4 == speed_line[j] || count-5 == speed_line[j] ||
      count-6 == speed_line[j] || count-7 == speed_line[j] || count-8 == speed_line[j] ||
      count-9 == speed_line[j] || count-10 == speed_line[j]){
      butterflies.add(new Butterflies());
      break;
    }
  }
  pic_summer.resize(1200, 900);
  image(pic_summer, 0, 0);
  for (int i = butterflies.size()-1; i >= 0; i--) {
    Butterflies butterfly = butterflies.get(i);
    if (i%3 == 0) {
      butterfly.move(5);
    } else if (i%3 == 1) {
      butterfly.move(-5);
    } else {
      butterfly.move(0);
    }
    butterfly.display();
  } 
    count++;
}

//autumn with falling leaves and wind  
if (mode == 4) {
  audio_leaf.amp(0.9);
  gui.setVisible(false);
  for (int j = 0; j < 20; j++) {
    if (count == speed_line[j] || count-1 == speed_line[j] || count-2 == speed_line[j] || 
      count-3 == speed_line[j] || count-4 == speed_line[j] || count-5 == speed_line[j] ||
      count-6 == speed_line[j]){
      leaves.add(new Leaves(c1));
      leaves.add(new Leaves(c2));
      leaves.add(new Leaves(c3));
      break;
    }
  }
  pic_autumn.resize(1200, 900);
  image(pic_autumn, 0, 0);
  for (int i = leaves.size()-1; i >= 0; i--) { 
    Leaves leaf = leaves.get(i);
    leaf.move();
    leaf.display();
  } 
    count++;
}
}

void mousePressed() {
    x = mouseX;
    y = mouseY;
  if (mouseButton == LEFT) {
    if (mode != 0  && y < 900)
    {
      mode = 0;
    }
    else
    {
      count = 0;
      if (x < 600 && y < 450)
      {
        mode = 1; //winter
      }
      if (x > 600 && y < 450)
      {
        mode = 2; //spring
      }
      if (x < 600 && y > 450 && y < 900)
      {
        mode = 3; //summer
      }
      if (x > 600 && y > 450  && y < 900)
      {
        mode = 4; //autumn
      }
    }
   } 
    
//drawing line with point and write massive for effects    
    if (mouseButton == RIGHT) {
      if (cnt_click < 20 && mode == 0) {
        speed_mouse[cnt_click] = millis();
        speed_line[cnt_click] = (speed_mouse[cnt_click]-speed_mouse[0])/5;
        dots[cnt_click] = 460 + (speed_mouse[cnt_click]-speed_mouse[0])/20;
        cnt_click++;
      }
    }
}

public void refresh() {
  Arrays.fill(speed_mouse, 0);
  Arrays.fill(speed_line, 0);
  Arrays.fill(dots, 0);
  cnt_click=0;
}
