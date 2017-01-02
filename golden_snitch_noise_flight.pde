PVector location;
PVector velocity;

float xoff, yoff, zoff;

int boxDepth;

void setup(){
  boxDepth = 500;
  size(640,360);
  yoff = 10000;
  zoff = 20000;
  location = new PVector(width / 2, height / 2, boxDepth / 2);
  velocity = new PVector(10, 2, 2);
  
}

void draw(){
    
  do {
  velocity.x = map(noise(xoff), 0,1,-6,6);
  xoff += 0.03;
  } while(location.x + velocity.x < 0 || location.x + velocity.x > width);
  
  do {
  velocity.y = map(noise(yoff), 0,1,-6,6);
  yoff += 0.03;
  } while(location.y + velocity.y < 0 || location.y + velocity.y > height);
  
  do{
  velocity.z = map(noise(zoff), 0,1,-6,6);
  zoff += 0.03;
  } while(location.z + velocity.z < 0 || location.z + velocity.z > boxDepth);
  
  background(169, 221, 240);
  
  location.add(velocity);
  
  stroke(0);
  fill(227,185,101);
  float size = map(location.z, 0, 500, 5, 35);
  
  stroke(1);
  line(location.x, location.y, location.x - size * 0.8, location.y - size * 0.2);
  line(location.x, location.y, location.x + size * 0.8, location.y - size * 0.2);
  
  ellipse(location.x, location.y, size, size);
  
  
  
}