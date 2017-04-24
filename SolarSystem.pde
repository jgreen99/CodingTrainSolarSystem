import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

//began by declaring my planet named the sun.
Planet sun;

PeasyCam cam;

//made a function named setup, setup declares my size, updates sun and spawns moons.
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  sun = new Planet(random(50, 100), 0, 0);
  sun.spawnMoons(4, 1);
}

//made a function named draw, draw declares background and lights.
//it also translates my width and height by 2.
//it also shows the sun and it's orbits.
void draw() {
  background(0);
  lights();
  sun.show();
  sun.orbit();
}