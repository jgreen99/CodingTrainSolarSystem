//declared my class named planet.
//In the class, I declared 7 floats, 3 voids.
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  Planet[] planets;
  PVector v;
  //declared 3 new variables: r, d and o.
  //also updated previously declared variables.
  Planet(float r, float d, float o) {
    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o;
    //println(angle);
  }
  //made a function named orbit.
  //orbit updates angle and declares an if and for statement.
  //it also shows the planets in orbit.
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  //made a function named spawnMoons.
  //spawnMoons updates the array list planets.
  //declares 3 new floats: r, d, and o.
  //another if statement and an int named num.
  //this should spawn moons if level is less than 2.
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r), (radius+r)*2);
      float o = random(-0.1, 0.1);
      planets[i] = new Planet(r, d, o);
      if (level < 2) {
        int num = int(random(0, 4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  //made a function called show.
  //show declares pushMatrix and noStroke.
  //it also fills in the spheres
  //as well as rotates them and translates them by distance and 0..
  //also declares sphere and an if and for statement.
  //this should show all the spheres in the solar system.
  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    fill(255);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    //line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);

    translate(v.x, v.y, v.z);
    noStroke();
    sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);
    if (planets != null) {
      //println(planets.length);
      printArray(planets);
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}