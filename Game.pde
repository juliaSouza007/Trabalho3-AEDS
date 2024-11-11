class Game {
  AgenteRL agente;

  int pontuacao;
  int quadroAtual;
  int quadroUltimaAcao;
  String estadoUltimaAcao;
  int ultimaAcao;

  Game() {
    paddle = new Paddle(width/2, height - 20, ALTURA_PLATFORM, LARGURA_PLATFORM, VELOCIDADE_PLATFORM);
    bola = new Bola(width/2, height/2, RAIO_BALL, speed);
    agente = new AgenteRL(0.1, 0.99, 1.0, 0.01, 0.001);
    reiniciar();
  }

  void reiniciar() {
    
    paddle = new Paddle(width/2, height - 20, ALTURA_PLATFORM, LARGURA_PLATFORM, VELOCIDADE_PLATFORM);
    bola = new Bola(width/2, height/2, RAIO_BALL, speed);
    pontuacao = 0;
    gameOver = false;
    acertou = false;
    quadroAtual = 0;
    quadroUltimaAcao = 0;
    estadoUltimaAcao = obterEstado();
    ultimaAcao = round(random(2));
  }

  String obterEstado() {
    int bolaY =  round(map(bola.pos.y, 0, width, 0, 10));
    int aberturaErro = round(map(bola.pos.x - paddle.pos.x, 0, height, 0, 20));
    return  bolaY + "," + aberturaErro;
  }

  void atualizar() {
    quadroAtual++;

    // Ação do RL      
      float recompensa = 0;
      if (gameOver){
        recompensa = -100;
      }else if (acertou){
        recompensa = 10;
      }else{
        recompensa = min(bola.pos.x, paddle.pos.x) / max(bola.pos.x, paddle.pos.x);
      }
      
      String estadoAtual = obterEstado();
      agente.atualizarValorQ(estadoUltimaAcao, ultimaAcao, recompensa, estadoAtual);

      ultimaAcao = agente.escolherAcao(estadoAtual);

      if (ultimaAcao == 1) paddle.vel = - VELOCIDADE_PLATFORM; // Left
      else if (ultimaAcao == 2) paddle.vel = VELOCIDADE_PLATFORM; // Right


      estadoUltimaAcao = estadoAtual;
      quadroUltimaAcao = quadroAtual;

    paddle.update();
    bola.update(); 
  }

  void desenhar() {
    //background(bgColor);
    surface.setTitle(estadoUltimaAcao);

    bola.update();
    paddle.update();

    // Exibe pontuação
    fill(#FFFFFF);
    textSize(32);
    text("Points: " + pontuacao, width - 220, 40);
    text("Media: " + nf(float(total)/float(pontuacoes.size()),1,2),  width - 220, 70);

    if (gameOver) {
      text("GameOver", width/2 - 70, height/2);
    }
  }
}
