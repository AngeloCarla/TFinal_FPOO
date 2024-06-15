/* --- ATRIBUTOS --- */
private Jugador player;
private JoyPad joypad;
private Hud hud;
private Laberinto laberinto;
private int estado = MaquinaEstados.iniciando;

/* --- METODOS --- */
void setup() {
  size(600, 600);
  frameRate(60);
  player = new Jugador(new PVector(width/2, height/2), new PVector(100, 100));
  joypad = new JoyPad();
  hud = new Hud();
  laberinto = new Laberinto(21, 21);
}

void draw() {
  background(50);

  /* --- Establece la MAQUINA DE ESTADOS ---
   Inciando, Jugando, Ganando y Perdiendo */
  switch(estado) {
  case MaquinaEstados.iniciando:
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("The Cave of the Dragon", width/2, height/2);
    break;
  case MaquinaEstados.jugando:
    laberinto.display();
    hud.display();
    player.display();
    break;
  case MaquinaEstados.ganando:
    break;
  case MaquinaEstados.perdiendo:
    break;
  }

  /* --- Establece el JOYPAD ---
   Arriba, Abajo, Izquierda y Derecha */
  if (estado == MaquinaEstados.jugando) {
    if (joypad.isUp()) {
      player.mover(1);
    }

    if (joypad.isDown()) {
      player.mover(2);
    }

    if (joypad.isLeft()) {
      player.mover(3);
    }

    if (joypad.isRight()) {
      player.mover(4);
    }
  }
}

//Al Presionar una Tecla
void keyPressed() {
  //Establece las teclas para cambiar el ESTADO de juego
  if (keyCode==ENTER) {
    estado = MaquinaEstados.jugando;
  }

  //Establece las teclas a usar para MOVER al personaje
  if (key=='w'||key=='W'||keyCode==UP) {//ARRIBA
    joypad.setUp(true);
  }

  if (key=='s'||key=='S'||keyCode==DOWN) {//ABAJO
    joypad.setDown(true);
  }

  if (key=='a'||key=='A'||keyCode==LEFT) {//IZQUIERDA
    joypad.setLeft(true);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) {//DERECHA
    joypad.setRight(true);
  }
}

//Al Soltar una Tecla
void keyReleased() {
  if (key=='w'||key=='W'||keyCode==UP) {//ARRIBA
    joypad.setUp(false);
  }

  if (key=='s'||key=='S'||keyCode==DOWN) {//ABAJO
    joypad.setDown(false);
  }

  if (key=='a'||key=='A'||keyCode==LEFT) {//IZQUIERDA
    joypad.setLeft(false);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) {//DERECHA
    joypad.setRight(false);
  }
}
