class Ball {
  float x;
  float y;
  int radius;
  int gravity = -10;
  float u = 5;
  float ux;
  float uy;
  
  float initialX;
  float initialY;

  Ball(float x, float y, int radius) {
    this.radius = radius;
    this.x = x;
    this.y = y - radius/2;
    
    initialX = x;
    initialY = y - radius/2;
  }

  void show() {
    circle(x, y, radius);
  }
  
  void feedAngle(float angle) {
    ux = u * cos(angle);
    uy = u * sin(angle);
  }
  
  void move(float time) {
    float x = initialX + ux * time;
    
    //println(ux * time);
    
    //float vy = uy + gravity * time;
    //float y = initialY + (vy*vy - uy*uy) / 2*gravity;
    
    this.x = x;
    //this.y = y;
    
    show();
  }
}
