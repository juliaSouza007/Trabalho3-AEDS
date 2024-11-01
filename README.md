# Trabalho3-AEDES - Implementação de Q-Learning no Pong

# Descrição Geral 
Neste trabalho, os alunos deverão implementar um agente de Aprendizado por Reforço (Reinforcement Learning) utilizando o algoritmo Q-Learning para jogar uma versão simplificada do clássico jogo Pong, desenvolvido na linguagem Processing. O jogo será para um único jogador, onde o objetivo é mover uma plataforma horizontal para rebater a bola contra a parede oposta. O jogador perde se a bola passar pela plataforma.

**Objetivos**
- Desenvolver um jogo Pong simplificado em Processing.
- Implementar um agente de Aprendizado por Reforço utilizando o algoritmo Q-Learning.
- Treinar o agente para jogar o jogo autonomamente.
- Apresentar os resultados em uma apresentação de 10 minutos.

**Requisitos do Trabalho**
- Implementação do Jogo em Processing

**Estrutura Básica do Jogo:**
- Plataforma (Paddle): Controlada inicialmente pelo usuário para testes, posteriormente pelo agente.
- Bola: Deve se mover continuamente, ricocheteando nas paredes e na plataforma.

**Regras do Jogo:**
- A bola começa no centro com uma direção aleatória.
- Se a bola tocar na parede oposta sem passar pela plataforma, continua o jogo.
- Se a bola passar pela plataforma, o jogo termina (derrota).

**Detalhes de Implementação:**
- Configuração da Janela: Definir o tamanho adequado para visualizar claramente todos os elementos.
- Atualização da Tela: Utilizar a função draw() para atualizar os movimentos em tempo real.
- Interação: Inicialmente, implementar controle manual da plataforma para assegurar o funcionamento do jogo.
- Implementação do Agente RL com Q-Learning

**Definição do Ambiente:**
- Estados: Definir estados discretos baseados na posição da bola e da plataforma. Por exemplo, dividir o espaço em uma grade.
- Ações: Movimentos possíveis da plataforma (por exemplo, mover para a esquerda, para a direita, ou permanecer parado).

**Recompensas:**
- Recompensa positiva por rebater a bola.
- Recompensa negativa (ou penalidade) se a bola passar pela plataforma.

**Algoritmo Q-Learning:**
Pseudocódigo:
```
Inicializar Q(s,a) arbitrariamente
Para cada episódio:
    Inicializar estado s
    Enquanto o estado s não for terminal:
        Escolher a ação a usando uma política ε-greedy a partir de Q(s,a)
        Executar ação a, observar recompensa r e próximo estado s'
        Atualizar Q(s,a):
            Q(s,a) = Q(s,a) + α * [r + γ * max_a' Q(s',a') - Q(s,a)]
        Atualizar estado s = s'
```
**Explicação dos Parâmetros:**
- Q(s,a): Tabela de valores Q que armazena o valor esperado da ação a no estado s.
- α (Alpha - Taxa de Aprendizado): Controla o quanto os novos valores de Q atualizam os antigos. Intervalo entre 0 e 1.
- γ (Gama - Fator de Desconto): Determina a importância das recompensas futuras. Valor entre 0 e 1.
- ε (Epsilon): Probabilidade de escolher uma ação aleatória para garantir exploração. Decai com o tempo para favorecer a exploração inicial e a exploração posterior.
- Política ε-greedy: Seleciona a ação com o maior valor Q com probabilidade 1-ε ou uma ação aleatória com probabilidade ε.

**Implementação no Código:**
- Inicialização da Tabela Q: Pode ser uma matriz ou um hashmap, dependendo da representação dos estados.
- Escolha da Ação: Implementar a lógica ε-greedy para seleção da ação.
- Atualização da Tabela Q: Aplicar a fórmula de atualização em cada iteração.
- Parâmetros de Treinamento: Ajustar α, γ e ε para otimizar o aprendizado.

# Apresentação
- Duração: 10 minutos de apresentação + 5 minutos para perguntas.
**Conteúdo da Apresentação:**
- Introdução ao Trabalho:
- Objetivo do projeto.
- Breve visão geral do jogo e do algoritmo Q-Learning.
- Desenvolvimento do Jogo:
- Mostrar imagens ou vídeos curtos do jogo em funcionamento.
- Explicar como o jogo foi implementado em Processing, destacando desafios e soluções encontradas.

**Implementação do Agente RL:**
- Descrição de como os estados, ações e recompensas foram definidos.
- Apresentar gráficos ou tabelas que demonstram a evolução do aprendizado do agente.
- Explicar como o algoritmo Q-Learning foi integrado ao jogo.

**Resultados e Conclusões:**
- Demonstrar o agente jogando autonomamente.
- Discutir o desempenho do agente.
- Mencionar possíveis melhorias futuras.

**Orientações para a Apresentação:**
- Código: Incluir apenas trechos de código essenciais para ilustrar pontos específicos. Evitar excesso de código nos slides.
- Visual: Utilizar gráficos, fluxogramas e imagens para facilitar o entendimento.
- Clareza: Explicar os conceitos de forma clara e objetiva, contextualizando cada parte do trabalho.

# Avaliação
**Apresentação (10 pontos):**
- Qualidade dos Slides: Organização, clareza e recursos visuais.
- Conteúdo Apresentado: Cobertura dos tópicos solicitados.
- Demonstração: Vídeo do jogo em funcionamento com o agente.
- Comunicação Oral: Capacidade de explicar o projeto.

**Funcionamento do Código (5 pontos):**
- Corretude da Implementação: O jogo e o agente funcionam conforme o esperado.
- Qualidade do Código: Organização e boas práticas de programação.
- Originalidade: Implementações adicionais ou melhorias serão consideradas.

# Entrega
- Código Fonte: Submeter todos os arquivos do projeto em Processing em formato zip com todos os recursos necessários.
- Slides da Apresentação: Arquivo em formato PDF ou PowerPoint.
- Vídeo de Funcionamento: Enviar separadamente um vídeo demonstrando o agente jogando.

# Dicas para Implementação
- Simplifique os Estados: Para facilitar o aprendizado do agente, discretize os estados em vez de usar valores contínuos.
- Teste Progressivamente: Comece testando o jogo sem o agente, depois implemente um agente com ações aleatórias antes de aplicar o Q-Learning.
- Monitore o Aprendizado: Registre as recompensas ao longo do tempo para visualizar o progresso do agente.
- Ajuste os Parâmetros: Experimente diferentes valores de α, γ e ε para melhorar o desempenho.
