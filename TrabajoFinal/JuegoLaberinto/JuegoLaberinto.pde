/* --- ATRIBUTOS --- */
private Jugador player;//Clase Jugador
private JoyPad joypad;//Clase JoyPad
private Escenario escenario;//Clase Escenario
private Laberinto laberinto;//Clase Laberinto
private Hud hud;//Clase Hud
private ObjetoMagico trofeo;//Clase ObjetoMagico
private int estado = MaquinaEstados.iniciando;//Establece el esatdo INICIAL a INICIANDO
import ddf.minim.*;
Minim minim;
private AudioPlayer audioI;//Almacena la musica de la pantalla de inicio
private AudioPlayer audioJ;//Almacena la musica cuando se esta jugando

/* --- METODOS --- */
void setup() {
  size(600, 600);//Establece el tamaño del lienzo
  frameRate(60);//Estable el FrameRate a 60 Frames Por Segundo (FPS)
  player = new Jugador(new PVector(92, 145), new PVector(100, 100), 30, 30);//Inicializacion del JUGADOR
  joypad = new JoyPad();//Inicializacion del JOYPAD
  escenario = new Escenario();//Inicializacion de Escenario
  laberinto = new Laberinto();//Inicializacion del LABERINTO
  hud = new Hud();//Inicializacion del HUD
  trofeo = new ObjetoMagico(new PVector(65, 470), 30, 30);//Inicializacion del ObjetoMagico alias Trofeo
  minim = new Minim (this);
  audioI = minim.loadFile("InterstellarSpace.wav");
  audioJ = minim.loadFile("Easter-Wonders.wav");
}

void draw() {
  background(50);//Fondo
  frameRate(60);

  int mouseXCoord = mouseX;
  int mouseYCoord = mouseY;
  
  fill(255, 0, 0); // Color rojo
  noStroke();
  ellipse(mouseXCoord, mouseYCoord, 10, 10);
  
  println("x" + mouseXCoord,"y" + mouseYCoord);
  
  /* --- Establece la MAQUINA DE ESTADOS ---
   Inciando, Jugando, Ganando y Perdiendo */
  switch(estado) {
  case MaquinaEstados.iniciando://Pantalla de Inicio
    noTint();
    image(loadImage("inicio.png"), 0, 0, 600, 600);//Imagen de Fondo de la Pantalla de Inicio
    tint(69, 131, 38);
    image(loadImage("enter.png"), 150, 300, 300, 300);
    tint(150, 255, 98);
    image(loadImage("titulo.png"), 0, - 112, 600, 600);//Imagen del Titulo de la Pantalla de Inicio
    //audioI.play();//Reproduce la musica de inicio
    break;
  case MaquinaEstados.jugando://Pantalla de Juego
    laberinto.display();
    trofeo.display();
    escenario.display();
    //audioI.pause();
    //audioJ.play();

    boolean move = false;

    if (estado == MaquinaEstados.jugando) {
      if (joypad.isUp()) {
        player.mover(MaquinaEstadosJugador.moveUp, laberinto.getCollideLab());
        move = true;
      }

      if (joypad.isDown()) {
        player.mover(MaquinaEstadosJugador.moveDown, laberinto.getCollideLab());
        move = true;
      }

      if (joypad.isLeft()) {
        player.mover(MaquinaEstadosJugador.moveLeft, laberinto.getCollideLab());
        move = true;
      }

      if (joypad.isRight()) {
        player.mover(MaquinaEstadosJugador.moveRight, laberinto.getCollideLab());
        move = true;
      }

      if (!move) {
        player.detener();
      }
    }

    if (player.colision(trofeo)) {
      estado = MaquinaEstados.ganando;
    }

    if (player.colisionConAreas(laberinto.getCollideLab())) {
      estado = MaquinaEstados.perdiendo; // Cambiar estado a perdiendo cuando hay colisión
    }

    break;
  case MaquinaEstados.ganando://Pantalla Ganadora
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("¡Has Ganado!", width/2, height/2);//Muestra un mensaje ¡Has Ganado! al pasar al estado GANANDO
    audioJ.pause();//Reproduce la musica de cuando se esta jugando
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
  //Se restablecen todas las Clases
  estado = MaquinaEstados.iniciando;
  player = new Jugador(new PVector(92, 145), new PVector(100, 100), 30, 30);//Inicializacion del JUGADOR
  joypad = new JoyPad();//Inicializacion del JOYPAD
  escenario = new Escenario();//Inicializacion de Escenario
  laberinto = new Laberinto();//Inicializacion del LABERINTO
  hud = new Hud();//Inicializacion del HUD
  trofeo = new ObjetoMagico(new PVector(65, 470), 30, 30);//Inicializacion del ObjetoMagico alias Trofeo
  minim = new Minim (this);
  audioI = minim.loadFile("InterstellarSpace.wav");
  audioJ = minim.loadFile("Easter-Wonders.wav");
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
