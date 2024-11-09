// Variáveis do jogo
float paddleWidth = 100;
float paddleHeight = 20;
int raio = 20;
Paddle plataforma;
Bola bola;

void setup() {
  size(800, 600);
  plataforma = new Paddle(width/2-paddleWidth/2, height-30, paddleWidth, paddleHeight);
  bola = new Bola(raio);
}

void draw() {
  background(#0D0527);
  plataforma.Update();
  bola.Update(plataforma);
  plataforma.Draw();
  bola.Draw();

  // Verifica se a bola passou pela plataforma
  if (bola.posicao.y > height) {
    println("Game Over!");
    noLoop(); // Para o jogo
  }
}
