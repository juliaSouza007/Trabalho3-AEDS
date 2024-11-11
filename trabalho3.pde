Game game;

final int LARGURA_PLATFORM = 100;
final int ALTURA_PLATFORM = 20;
final float VELOCIDADE_PLATFORM = 1.5;
final float speed = 5;
final float RAIO_BALL = 20;

int total;
int pontuacaoMax;
boolean gameOver, acertou;
ArrayList<Integer> pontuacoes;
color bgColor = #0D0527;

void setup() {
  size(1000, 500);
  total = 0;
  pontuacaoMax = 0;
  game = new Game();
  pontuacoes = new ArrayList<Integer>();
  
  for (int i = 0; i < 100000; i++) {
    game.atualizar();
    if (gameOver) {
      pontuacoes.add(game.pontuacao);
      total += game.pontuacao;
      pontuacaoMax = max(pontuacaoMax, game.pontuacao);
      game.reiniciar();
    }
    
    gameOver = false;
    acertou = false;
  }
  background(bgColor);
  println(pontuacaoMax);
}

void draw() {
  background(bgColor);

  game.atualizar();
  game.desenhar();

  if (gameOver) {
    pontuacoes.add(game.pontuacao);
    pontuacaoMax = max(pontuacaoMax, game.pontuacao);
    game.reiniciar();
  }
}
