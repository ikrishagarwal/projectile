Ball ball;
boolean clicked = false;
boolean ended = false;

float lastMouseX;
float lastMouseY;
float angle;

float HMax;
float Range;

void setup() {
  size(1500, 800);
  background(0);

  ball = new Ball(50.0, height - 50.0, 30);
  HMax = height - 50;

  frameRate(90);
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
  line(50, height - 50 - ball.radius/2, 110, height - 50 - ball.radius/2);

  noFill();
  arc(50, height - 50 - ball.radius/2, 60, 60, - angle, 0);
  textSize(18);
  text(String.format("%.1f", degrees(angle)), 125, height - 80);

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

      line(50, height - 50 - ball.radius/2, ball.pos.x, height - 50 - ball.radius/2);
      text(String.format("%.2f units", ball.pos.x - 50.0), (ball.pos.x - 50)/2, height - 20);


      line(
        (ball.pos.x - 50)/2 + 50,
        height - 50 - ball.radius/2,
        (ball.pos.x - 50)/2 + 50,
        HMax
        );
      text(
        String.format("%.2f units", height - 50 - ball.radius/2 - HMax),
        (ball.pos.x - 50)/2 + 80,
        HMax + (height - 50 - ball.radius/2 - HMax)/2
        );

      ended = true;
      text("Press anywhere to restart", 10, 30);
      return;
    }

    HMax = min(HMax, ball.pos.y);

    line(50, height - 50 - ball.radius/2, ball.pos.x, height - 50 - ball.radius/2);
    line(
      min(Range/2 + 50, ball.pos.x),
      height - 50 - ball.radius/2,
      min(Range/2 + 50, ball.pos.x),
      HMax
      );

    fill(255);
    noStroke();
    ball.move();
    ball.path();
  }

  text("FPS: " + round(frameRate), 10, 30);
}

void mouseClicked() {
  if (!clicked) {
    clicked = true;
    ball.feedAngle(angle);
    Range = 3.75 * 3.75 * sin(2 * angle) / 0.01;
  }

  if (ended) {
    loop();
    ended = false;
    clicked = false;
    ball = new Ball(50.0, height - 50.0, 30);
    HMax = height - 50;
  }
}
