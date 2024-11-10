Paddle paddle;
Bola bola;

final int LARGURA_PLATFORM = 100;
final int ALTURA_PLATFORM = 20;
final float VELOCIDADE_PLATFORM = 1.5;
final float speed = 5;
final float RAIO_BALL = 20;

int total;
int pontuacaoMax;

boolean fimDeGame, acertou;

Game game;

ArrayList<Integer> pontuacoes;

color bgColor = #0D0527;

void keyReleased() {
  switch(key) {
  case 'b':
    bola.vel = new PVector(constrain(random(-1, 1)*10, -1, 1), constrain(random(-1, 1)*10, -1, 1));
    break;
  case 'r':
    setup();
    break;
  }
}

void setup() {
  total = 0;
  pontuacaoMax = 0;
  size(1000, 500);
  game = new Game();
  pontuacoes = new ArrayList<Integer>();
  for (int i = 0; i < 100000; i++) {
    game.atualizar();
    if (fimDeGame) {
          game.atualizar();

      pontuacoes.add(game.pontuacao);
      total += game.pontuacao;
      pontuacaoMax = max(pontuacaoMax, game.pontuacao);
      game.reiniciar();
    }
        fimDeGame = false;
    acertou = false;
  }
  background(bgColor);
  println(pontuacaoMax);
}

void draw() {
  background(bgColor);

  game.atualizar();
  game.desenhar();


  if (fimDeGame) {
    game.atualizar();

    pontuacoes.add(game.pontuacao);
    pontuacaoMax = max(pontuacaoMax, game.pontuacao);
    game.reiniciar();

  }
}
