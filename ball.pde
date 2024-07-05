import java.util.List;
import java.util.ArrayList;

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  List<PVector> history;
  
  int radius;

  Ball(float x, float y, int radius) {
    this.radius = radius;
    this.pos = new PVector(x, y - radius/2);
    
    acc = new PVector(0, 0.01);
    history = new ArrayList<PVector>();
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
    
    history.add(pos);
    
    show();
  }
  
  void path() {
    beginShape();
    stroke(255);
    for (PVector current: history) {
      curveVertex(current.x, current.y);
    }
    endShape();
  }
}
