class Bola {
  PVector pos, vel;
  float size;
  int count, lastHit;

  Bola(float x, float y, float size, float speed) {
    pos = new PVector(x, y);
    vel = new PVector(random(-1,1), 1);
    vel.mult(speed);
    this.size = size;
  }

  void update() {
    count++;
    
    pos.add(vel);
    
    // Se atingir parede
    if (pos.x - (size/2) <= 0){
      pos.x = size/2; 
      vel.x *= -1; 
    } else if (pos.x + (size/2) >= width){
      pos.x = width - (size/2);
      vel.x *= -1;
    }
     
    // Se atingir teto/chão
    if (pos.y - (size/2) <= 0){
      pos.y = size/2; 
      vel.y *= -1; 
    } else if (pos.y + (size/2) >= height){
      gameOver = true;
      pos.y = height - (size/2);
      vel.y *= -1;
    }

    if ( pos.y + (size/2) >= paddle.pos.y - (paddle.altura/2) &&
        pos.y - (size/2) <= paddle.pos.y + (paddle.altura/2) &&
        pos.x - (size/2) <= paddle.pos.x + (paddle.largura/2) &&
        pos.x + (size/2) >= paddle.pos.x - (paddle.largura/2)) {

        if (count - lastHit >= 20){
          acertou = true;
          vel.y *= -1;
          vel.x = (bola.pos.x - paddle.pos.x) / paddle.largura - 0.5;
          game.pontuacao++;
          lastHit = count;
        }
      }
    }
    
    this.show();
  }

  void show() {
    fill(#FDF2CB);
    ellipse(pos.x, pos.y, size, size);
  }
}
