class Ball {
  int x;
  int y;
  int radius = 25;
  
 Ball(int x, int y) {
   this.x = x;
   this.y = y - radius/2;
 }
 
 void show() {
  circle(x, y, radius); 
 }
}
