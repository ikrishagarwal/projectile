Ball ball;

void setup() {
  size(800, 600);
  background(0);

  ball = new Ball(50, height - 50);

  stroke(255);
  strokeWeight(2);
  line(0, height - 50, width, height - 50);

  ball.show();
}

void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(2);
  line(0, height - 50, width, height - 50);

  fill(255);
  ball.show();
  
  strokeWeight(1);
  line(50, height - 50, mouseX, mouseY);
  
  noFill();
  //arc(50, height - 50, 25, 25, 0, PI + QUARTER_PI);
}
