class Jugador implements IVisualizable, IPosicionable {
  /* --- ATRIBUTOS --- */
  private PVector posicion;//Posicion del Jugador
  private PVector velocidad;//Velocidad del movimiento del Jugador
  private Sprites sprite;//Inicializacion de Sprites
  private int statePlayer;//Estado del Jugador IDLE en sus 4 direcciones, ARRIBA, ABAJO, IZQUIERDA, DERECHA
  private Collider collideJugador;
  private PVector posicionAnterior;

  /* --- CONSTRUCTOR --- */
  public Jugador(PVector posicion, PVector velocidad, int ancho, int alto) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.collideJugador = new Collider(ancho, alto, posicion);//Inicializacion del collider segun el ancho, alto y posicion del Jugador
    sprite = new Sprites();//Inicializacion del Sprites
    statePlayer = MaquinaEstadosJugador.moveDown;//Estado inicial del Jugador en direccion hacia ABAJO
  }

  /* --- METODOS --- */
  //Metodo para visualizar al Jugador
  void display() {
    sprite.renderJugador(this.statePlayer, this.posicion);//Llama al metodo renderJugador
  }

  //Metodo para mover al jugador
  void mover(int direccion, ArrayList<Collider> colliders) {
    PVector deltaTime = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    PVector nuevaPosicion = posicion.copy();

    switch (direccion) {
    case MaquinaEstadosJugador.moveUp:
      nuevaPosicion.y -= deltaTime.y;
      statePlayer = MaquinaEstadosJugador.moveUp;
      break;
    case MaquinaEstadosJugador.moveDown:
      nuevaPosicion.y += deltaTime.y;
      statePlayer = MaquinaEstadosJugador.moveDown;
      break;
    case MaquinaEstadosJugador.moveLeft:
      nuevaPosicion.x -= deltaTime.x;
      statePlayer = MaquinaEstadosJugador.moveLeft;
      break;
    case MaquinaEstadosJugador.moveRight:
      nuevaPosicion.x += deltaTime.x;
      statePlayer = MaquinaEstadosJugador.moveRight;
      break;
    }

    posicionAnterior = posicion.copy(); // Guarda la posición anterior
    posicion = nuevaPosicion; // Mueve al jugador a la nueva posición

    collideJugador.setPosicion(posicion); // Actualiza la posición del collider del jugador

    if (colisionConAreas(colliders)) {
      posicion = posicionAnterior; // Restaura la posición anterior en caso de colisión
      collideJugador.setPosicion(posicion); // Restaura la posición del collider del jugador
    }

    verificarBorde();
  }

  void verificarBorde() {

    if (posicion.x < 50) {//Izquierda
      posicion.x = 50;
    }

    if (posicion.x > 550) {//DErecha
      posicion.x = 550;
    }

    if (posicion.y < 140) {//Arriba
      posicion.y = 140;
    }

    if (posicion.y > 545) {//ABAjo
      posicion.y = 545;
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

  //Metodo para detectar la colision con un ObjetoMagico
  boolean colision(ObjetoMagico obMg) {
    return collideJugador.colision(obMg.getCollideObMg());
  }

  boolean colisionConAreas(ArrayList<Collider> areasColision) {
    for (Collider area : areasColision) {
      if (collideJugador.colision(area)) {
        return true;
      }
    }
    return false;
  }

  /* --- METODOS ACCESORES --- */
  public Collider getCollideJugador() {
    return collideJugador;
  }

  public void setCollider(Collider collideJugador) {
    this.collideJugador = collideJugador;
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
