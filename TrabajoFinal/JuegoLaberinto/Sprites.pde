class Sprites {
  /* --- ATRIBUTOS --- */
  protected int xFrame;//Posicion actual en X del Frame
  protected int yFrame;//Posicion actual en Y del Frame
  protected int widthFrame;//Ancho del Frame
  protected int heightFrame;//Alto del Frame
  protected PImage spriteJugador;//Imagen del Jugador
  private float xFrameFloat;//Posicion flotante actual en X del Frame
  private float nextxFrameFloat;//Proxima posicion flotante en X del Frame
  private float velTransicion;//Velocidad de transicion entre Frames

  /* --- CONSTRUCTORES --- */
  public Sprites() {
    this.spriteJugador = loadImage("spriteJugadorV.png");
    this.xFrame = 0;
    this.yFrame = 0;
    this.widthFrame = 54;
    this.heightFrame = 78;
    this.xFrameFloat = 0;
    this.nextxFrameFloat = widthFrame;
    this.velTransicion = 10;
  }
  /*
  void limite() {
   rectMode(CENTER);
   noFill();
   stroke(0, 255, 0);
   rect(player.getPosicion().x, player.getPosicion().y, widthFrame, heightFrame);
   }
   */
  /* --- METODOS --- */
  //Metodo que se encarga de renderizar al personaje dependiendo del estado en el que se encuentra
  public void renderJugador(int state, PVector posicion) {
    imageMode(CENTER);
    //Implementacion del DeltaTime
    int framesPorSegundo = round(frameRate);
    float deltaTime = Time.getDeltaTime(framesPorSegundo);

    switch(state) {

    case MaquinaEstadosJugador.moveDown://Cuando se mueve hacia Abajo
      this.yFrame = 0;
      break;

    case MaquinaEstadosJugador.moveLeft://Cuando se mueve hacia la Izquierda
      this.yFrame = heightFrame;
      break;

    case MaquinaEstadosJugador.moveRight://Cuando se mueve hacia la Derecha
      this.yFrame = 2 * heightFrame;
      break;

    case MaquinaEstadosJugador.moveUp://Cuando se mueve hacia Arriba
      this.yFrame = 3 * heightFrame;
      break;

    case MaquinaEstadosJugador.idleDown://Cuando esta quieto en direccion hacia Abajo
      this.yFrame = 0;
      this.xFrame = 0;
      break;

    case MaquinaEstadosJugador.idleLeft://Cuando esta quieto en direccion hacia la Izquierda
      this.yFrame = heightFrame;
      this.xFrame = 0;
      break;

    case MaquinaEstadosJugador.idleRight://Cuando esta quieto en direccion hacia la Derecha
      this.yFrame = 2 * heightFrame;
      this.xFrame = 0;
      break;

    case MaquinaEstadosJugador.idleUp://Cuando esta quieto en direccion hacia Arriba
      this.yFrame = 3 * heightFrame;
      this.xFrame = 0;
      break;
    }

    // Renderiza la imagen del jugador con el frame ajustado según el estado

    image(spriteJugador.get(this.xFrame, yFrame, widthFrame, heightFrame), posicion.x, posicion.y, 30, 30);

    // Si el jugador no está en estado idle, avanza la animación
    if (state != MaquinaEstadosJugador.idleDown && state != MaquinaEstadosJugador.idleLeft &&
      state != MaquinaEstadosJugador.idleRight && state != MaquinaEstadosJugador.idleUp) {
      xFrameFloat += (widthFrame * velTransicion * deltaTime);  // Actualiza la posición flotante del frame
      if (xFrameFloat >= nextxFrameFloat) {
        this.xFrame += this.widthFrame;  // Avanza al siguiente frame
        nextxFrameFloat = xFrame + this.widthFrame;  // Actualiza la próxima posición flotante del frame
        if (this.xFrame >= this.spriteJugador.width) {
          this.xFrame = 0;  // Reinicia al inicio si alcanza el final de la imagen
          this.xFrameFloat = 0;  // Reinicia la posición flotante del frame
          this.nextxFrameFloat = this.widthFrame;  // Reinicia la próxima posición flotante del frame
        }
      }
    }
  }
}
