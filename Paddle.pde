class Paddle {
  PVector posicao;
  float largura;
  float altura;

  Paddle(float x, float y, float largura, float altura) {
    this.posicao = new PVector(x, y);
    this.largura = largura;
    this.altura = altura;
  }

  void Draw() {
    fill(255);
    rect(posicao.x, posicao.y, largura, altura);
  }
  
  void Update() {
    this.posicao.x = mouseX;
  }
}
