/* --- ATRIBUTOS --- */
private Jugador player;//Clase Jugador
private JoyPad joypad;//Clase JoyPad
private Laberinto laberinto;//Clase Laberinto
private Hud hud;//Clase Hud
private int estado = MaquinaEstados.iniciando;//Establece el esatdo INICIAL a INICIANDO

/* --- METODOS --- */
void setup() {
  size(600, 600);//Establece el tamaño del lienzo
  frameRate(60);//Estable el FrameRate a 60 Frames Por Segundo (FPS)
  player = new Jugador(new PVector(width/2, height/2), new PVector(100, 100));//Inicializacion del JUGADOR
  joypad = new JoyPad();//Inicializacion del JOYPAD
  laberinto = new Laberinto();//Inicializacion del LABERINTO
  hud = new Hud();//Inicializacion del HUD
}

void draw() {
  background(50);
  frameRate(30);
  /* --- Establece la MAQUINA DE ESTADOS ---
   Inciando, Jugando, Ganando y Perdiendo */
  switch(estado) {
  case MaquinaEstados.iniciando://Pantalla de Inicio
    //imageMode(CENTER);
    image(loadImage("intro.png"), 0, 0, 600, 600);//Imagen de Fondo de la Pantalla de Inicio
    image(loadImage("titulo.png"), 0, - 210, 600, 600);//Imagen del Titulo de la Pantalla de Inicio
    break;
  case MaquinaEstados.jugando://Pantalla de Juego
    laberinto.display();//Muestra el escenario
    hud.display();//Muestra el Hud
    player.display();//Muestra al Jugador

    /* --- Establece el JOYPAD ---
     Arriba, Abajo, Izquierda y Derecha */
    boolean move = false;
    
    if (estado == MaquinaEstados.jugando) {
      if (joypad.isUp()) {
        player.mover(MaquinaEstadosJugador.moveUp);
        move = true;
      }

      if (joypad.isDown()) {
        player.mover(MaquinaEstadosJugador.moveDown);
        move = true;
      }

      if (joypad.isLeft()) {
        player.mover(MaquinaEstadosJugador.moveLeft);
        move = true;
      }

      if (joypad.isRight()) {
        player.mover(MaquinaEstadosJugador.moveRight);
        move = true;
      }

      if (!move) {
        player.detener();//Detiene al personaje si no hay teclas presionadas
      }
    }

    break;
  case MaquinaEstados.ganando://Pantalla Ganadora
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("¡Has Ganado!", width/2, height/2);//Muestra un mensaje ¡Has Ganado! al pasar al estado GANANDO
    break;
  case MaquinaEstados.perdiendo://Pantalla Perdedora
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("¡Has Perdido!", width/2, height/2);//Muestra un mensaje ¡Has Perdido! al pasar al estado PERDIENDO
    break;
  }
}

//Metodo para reiniciar el juego
void reiniciarJuego() {
  //Se RESTABLECEN todas las Clases
  player = new Jugador(new PVector(width / 2, height / 2), new PVector(100, 100));
  joypad = new JoyPad();
  hud = new Hud();
  laberinto = new Laberinto();
  estado = MaquinaEstados.iniciando;
}

void keyPressed() {
  //Establece las teclas para cambiar el ESTADO de juego
  if (keyCode == ENTER) {
    if (estado == MaquinaEstados.iniciando) {
      estado = MaquinaEstados.jugando;
    } else if (estado == MaquinaEstados.perdiendo || estado == MaquinaEstados.ganando) {
      reiniciarJuego(); //Reinicia el juego si está en los estados de GANANDO o PERDIENDO
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
