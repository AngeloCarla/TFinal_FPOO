/* --- ATRIBUTOS --- */
private Jugador player;//Clase Jugador
private JoyPad joypad;//Clase JoyPad
private Escenario escenario;//Clase escenario
private int estado = MaquinaEstados.iniciando;//Establece el esatdo INICIAL a INICIANDO

/* --- METODOS --- */
void setup() {
  size(600, 600);//Establece el tamaño del lienzo
  frameRate(60);//Estable el FrameRate a 60 Frames Por Segundo (FPS)
  player = new Jugador(new PVector(width/2, height/2), new PVector(100, 100));//Inicializacion del JUGADOR
  joypad = new JoyPad();//Inicializacion del JOYPAD
  escenario = new Escenario();//Inicializacion del ESCENARIO
}

void draw() {
  background(50);

  /* --- Establece la MAQUINA DE ESTADOS ---
   Inciando, Jugando, Ganando y Perdiendo */
  switch(estado) {
  case MaquinaEstados.iniciando://Pantalla de Inicio
    //imageMode(CENTER);
    image(loadImage("intro.png"), 0, 0, 600, 600);
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text("ka'aguyrusu", width/2, 50);
    textSize(20);
    fill(250, 250, 250);
    text("press 'ENTER'", width/2, height - 201);
    break;
  case MaquinaEstados.jugando://Pantalla de Juego
    escenario.display();//Muestra el escenario
    player.display();//Muestra al Jugador
    break;
  case MaquinaEstados.ganando://Pantalla Ganadora
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("¡Has Ganado!", width/2, height/2);
    break;
  case MaquinaEstados.perdiendo://Pantalla Perdedora
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("¡Has Perdidio!", width/2, height/2);
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

//Metodo para reiniciar el juego
void reiniciarJuego() {
  player = new Jugador(new PVector(width / 2, height / 2), new PVector(100, 100));
  joypad = new JoyPad();
  escenario = new Escenario();
  estado = MaquinaEstados.iniciando;
}

//Al Presionar una Tecla
void keyPressed() {
  //Establece las teclas para cambiar el ESTADO de juego
 if (keyCode == ENTER) {
    if (estado == MaquinaEstados.iniciando) {
      estado = MaquinaEstados.jugando;
    } else if (estado == MaquinaEstados.perdiendo || estado == MaquinaEstados.ganando) {
      reiniciarJuego(); // Reinicia el juego si está en los estados de ganando o perdiendo
    }
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
  //Establece las teclas a usar para MOVER al personaje
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
