import java.util.List;
import java.util.ArrayList;

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  List<float[]> history;
  
  int radius;

  Ball(float x, float y, int radius) {
    this.radius = radius;
    this.pos = new PVector(x, y - radius/2);
    
    acc = new PVector(0, 0.01);
    history = new ArrayList<float[]>();
  }

  void show() {
    circle(pos.x, pos.y, radius);
  }
  
  void feedAngle(float angle) {
    vel = PVector.fromAngle(angle);
    vel.mult(3.75);
    vel.y *= -1;
  }
  
  void move() {
    vel.add(acc);
    pos.add(vel);
    
    float[] coord = {pos.x, pos.y};
    history.add(coord);
    
    show();
  }
  
  void path() {
    beginShape();
    stroke(255);
    noFill();
    for (float[] current: history) {
      curveVertex(current[0], current[1]);
    }
    endShape();
  }
}
