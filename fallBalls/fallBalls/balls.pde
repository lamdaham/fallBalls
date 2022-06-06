class Ball {
  
  float x, y;
  float radius;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    radius = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].radius + radius;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    x += vx;
    y += vy;
    if (x<radius) {
      vx  = -1 * vx;
      x=radius;
    } else if (x > 640-radius) {
      vx  = -1 * vx;
      x=(width-radius);
    }
    
    if (y< 640 - radius) {
      vy += gravity;
      y += vy;
    }
     if (y > 640 - radius) {
        vy = -1 * vy;
        y =height-radius;
     } else if (y<radius) {
        vy = -1 * vy;
        y=radius;
     }
    
  }
  
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
