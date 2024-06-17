class Jugador {
  /* --- ATRIBUTOS --- */
  private PVector posicion;//Posicion del Jugador
  private PVector velocidad;//Velocidad del movimiento del Jugador
  private int vida;//Vida del jugador


  /* --- CONSTRUCTOR --- */
  public Jugador(PVector posicion, PVector velocidad) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    vida = 3;//Vidas iniciales del jugador
  }

  /* --- METODOS --- */
  //Metodo para dibujar al Jugador
  void display() {
    noStroke();
    fill(150, 121, 240);
    rectMode(CENTER);
    ellipse(posicion.x, posicion.y, 20, 20);
  }

  //Metodo para perder una vida
  void perderVida() {
    vida--;//Se decrementa un valor a atributo vida
  }

  //Metodo para MOVER al jugador
  void mover(int direccion) {
    //Implementacion del DELTATIME
    PVector movimiento = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    PVector nuevaPosicion = posicion.copy();//Copia de la posicion actual

    //Establece el movimiento del Jugador en base a la direccion
    switch(direccion) {
    case 1://ARRIBA
      nuevaPosicion.y -= movimiento.y;
      break;
    case 2://ABAJO
      nuevaPosicion.y += movimiento.y;
      break;
    case 3://iZQUIERDA
      nuevaPosicion.x -= movimiento.x;
      break;
    case 4://DERECHA
      nuevaPosicion.x += movimiento.x;
      break;
    }

    posicion = nuevaPosicion;
  }

  void morir() {
    if (vida>=0) {
      estado = MaquinaEstados.perdiendo;
    }
  }

  /* --- METODOS ACCESORES --- */
  public int getVidas() {
    return vida;
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
