Ball ball;
boolean clicked = false;

float lastMouseX;
float lastMouseY;
float angle;

void setup() {
  size(1500, 800);
  background(0);

  ball = new Ball(50.0, height - 50.0, 30);

  frameRate(120);
}

void draw() {
  background(0);
  fill(255);

  stroke(255);
  strokeWeight(2);
  line(0, height - 50, width, height - 50);

  if (!clicked) {
    noStroke();
    ball.show();
  }

  strokeWeight(1);
  stroke(255);
  line(50, height - 50 - ball.radius/2, lastMouseX, lastMouseY);

  noFill();
  arc(50, height - 50 - ball.radius/2, 60, 60, - angle, 0);
  line(50, height - 50 - ball.radius/2, 110, height - 50 - ball.radius/2);
  textSize(18);
  text(String.format("%.1f", degrees(angle)), 125, height - 60);

  if (mouseY < height - 50 && mouseX > 50 && !clicked) {
    lastMouseX = mouseX;
    lastMouseY = mouseY;

    angle = atan2(height - 50 - mouseY, mouseX - 50);
  }

  if (clicked) {
    if (ball.vel.y > 0 && ball.pos.y >= height - 50 - ball.radius/2) {
      noLoop();
      fill(255);
      noStroke();
      ball.show();
      ball.path();
      
      return;
    }
    
    fill(255);
    noStroke();
    ball.move();
    ball.path();
  }
}

void mouseClicked() {
  if (!clicked) {
    clicked = true;
    ball.feedAngle(angle);
  }
}
