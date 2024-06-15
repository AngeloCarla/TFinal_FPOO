class Jugador {
  /* --- ATRIBUTOS --- */
  private PVector posicion;
  private PVector velocidad;
  private int vida;

  /* --- CONSTRUCTOR --- */
  public Jugador(PVector posicion, PVector velocidad) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    vida = 3;
  }

  /* --- METODOS --- */
  void display() {
    noStroke();
    fill(150, 121, 240);
    rectMode(CENTER);
    rect(posicion.x, posicion.y, 20, 20);
  }

  void perderVida() {
    vida--;
    reespawn();
  }

  void reespawn() {
    posicion = new PVector(width/2, height/2);
  }

  void mover(int direccion) {
    PVector deltaTime = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    switch(direccion) {
    case 1://Ariba
      this.posicion.y -= deltaTime.y;
      break;
    case 2://Abajo
      this.posicion.y += deltaTime.y;
      break;
    case 3://izquierda
      this.posicion.x -= deltaTime.x;
      break;
    case 4://Derecha
      this.posicion.x += deltaTime.x;
      break;
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
