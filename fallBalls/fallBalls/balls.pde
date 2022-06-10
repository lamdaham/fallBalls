import java.util.*;

class Ball {
  
  float x, y;
  float radius;
  float vx = 0;
  float vy = 0;
  int id;
  double mass;
 
  Ball(float xin, float yin, float din, int idin) {
    x = xin;
    y = yin;
    radius = din;
    id = idin;
    mass = radius *radius / 20;
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
