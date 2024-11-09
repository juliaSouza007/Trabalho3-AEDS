class Bola {
  PVector posicao;
  PVector velocidade;
  int raio;

  Bola(int raio) {
    this.posicao = new PVector();
    this.velocidade = new PVector();
    this.raio = raio;
    Reset();
  }

  void Reset() {
    // Reinicia a bola no centro com uma direção aleatória
    this.posicao.x = width / 2;
    this.posicao.y = height / 2;
    this.velocidade.x = random(-5, 5);
    this.velocidade.y = random(2, 5);
  }

  void Draw() {
    fill(#F3FA95);
    ellipse(posicao.x, posicao.y, raio, raio);
  }

  void Update(Paddle plataforma) {
    posicao.add(velocidade);

    // Verifica se bateu nas paredes
    if (posicao.x < raio/2 || posicao.x > width-raio/2) {
      velocidade.x *= -1;
    }
    if (posicao.y < raio) {
      velocidade.y *= -1;
    }

    // Verifica se bateu na plataforma
    if (posicao.y + raio/2 >= plataforma.posicao.y && 
        posicao.x >= plataforma.posicao.x &&
        posicao.x <= plataforma.posicao.x + plataforma.largura) {
      velocidade.y *= -1;
      posicao.y = plataforma.posicao.y - raio/2;
    }
  }
}
