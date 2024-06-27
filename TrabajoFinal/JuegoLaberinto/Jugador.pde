class Jugador implements IVisualizable {
  /* --- ATRIBUTOS --- */
  private PVector posicion;//Posicion del Jugador
  private PVector velocidad;//Velocidad del movimiento del Jugador
  private int vida;//Vida del jugador
  private Sprites sprite;
  private int statePlayer;

  /* --- CONSTRUCTOR --- */
  public Jugador(PVector posicion, PVector velocidad) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    vida = 3;//Vidas iniciales del jugador
    sprite = new Sprites();
    statePlayer = MaquinaEstadosJugador.moveUp;
  }

  /* --- METODOS --- */
  //Metodo para dibujar al Jugador
  void display() {
    sprite.renderJugador(this.statePlayer, this.posicion);
    luz.mostrar(this.posicion);
  }

  //Metodo para mover al jugador
  void mover(int direccion) {

    PVector deltaTime = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    switch(direccion) {

    case MaquinaEstadosJugador.moveUp://ARRIBA
      posicion.y -= deltaTime.y;
      statePlayer = MaquinaEstadosJugador.moveUp;
      break;
    case MaquinaEstadosJugador.moveDown://ABAJO
      posicion.y += deltaTime.y;
      statePlayer = MaquinaEstadosJugador.moveDown;
      break;
    case MaquinaEstadosJugador.moveLeft://iZQUIERDA
      posicion.x -= deltaTime.x;
      statePlayer = MaquinaEstadosJugador.moveLeft;
      break;
    case MaquinaEstadosJugador.moveRight://DERECHA
      posicion.x += deltaTime.x;
      statePlayer = MaquinaEstadosJugador.moveRight;
      break;
    }
  }

  //Metodo para actualiza el estado del jugador a IDLE (sin Movimiento) de cada direccion
  void detener() {
    switch (statePlayer) {
    case MaquinaEstadosJugador.moveDown:
      statePlayer = MaquinaEstadosJugador.idleDown;
      break;
    case MaquinaEstadosJugador.moveLeft:
      statePlayer = MaquinaEstadosJugador.idleLeft;
      break;
    case MaquinaEstadosJugador.moveRight:
      statePlayer = MaquinaEstadosJugador.idleRight;
      break;
    case MaquinaEstadosJugador.moveUp:
      statePlayer = MaquinaEstadosJugador.idleUp;
      break;
    }
  }

  //Metodo para perder una vida
  void perderVida() {
    vida--;//Se decrementa un valor a atributo vida
  }

  //Metodo para morir
  void morir() {
    if (vida>=0) {
      estado = MaquinaEstados.perdiendo;
    }
  }

  /* --- METODOS ACCESORES --- */
  public int getVidas() {
    return vida;
  }

  public void setStatePlayer(int statePlayer) {
    this.statePlayer=statePlayer;
  }

  public PVector getPosicion() {
    return posicion;
  }

  void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  public PVector getVelocidad() {
    return velocidad;
  }

  void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
