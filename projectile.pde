Ball ball;
boolean clicked = false;

float lastMouseX;
float lastMouseY;
float angle;

int frameCount = 0;

void setup() {
  size(800, 600);
  background(0);

  ball = new Ball(50.0, height - 50.0, 30);
  frameRate(10);
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(2);
  line(0, height - 50, width, height - 50);

  if (!clicked) {
    noStroke();
    fill(255);
    ball.show();
  }

  strokeWeight(1);
  stroke(255);
  line(50, height - 50 - ball.radius/2, lastMouseX, lastMouseY);

  noFill();
  arc(50, height - 50 - ball.radius/2, 60, 60, - angle, 0);
  line(50, height - 50 - ball.radius/2, 110, height - 50 - ball.radius/2);

  if (mouseY < height - 50 && mouseX > 50 && !clicked) {
    lastMouseX = mouseX;
    lastMouseY = mouseY;

    angle = atan2(height - 50 - mouseY, mouseX - 50);
  }

  if (clicked) {
    noStroke();
    ball.move(frameCount / frameRate);
  }

  frameCount++;
}

void mouseClicked() {
  if (!clicked) {
    clicked = true;
    ball.feedAngle(angle);
  }
}
