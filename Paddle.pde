class Paddle {
  PVector pos;
  float vel;
  float altura, largura;

  Paddle(float x, float y, float altura, float largura, float vel) {
    pos = new PVector(x, y);
    this.altura = altura;
    this.largura = largura;
    this.vel = vel;
  }

  void update() {
    if (pos.x - (largura/2) <= 0) {
      pos.x = largura/2;
      vel *= -1;
    } else if (pos.x + (largura/2) >= width) {
      pos.x = width - (largura/2);
      vel *= -1;
    }

    pos.x += vel;
  }

  void show() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(pos.x, pos.y, largura, altura);
  }
}
