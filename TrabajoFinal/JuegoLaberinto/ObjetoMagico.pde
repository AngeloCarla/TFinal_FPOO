class ObjetoMagico implements IVisualizable, IPosicionable {
  /* --- ATRIBUTOS --- */
  private PVector posicion;//Posicion del ObjetoMagico
  private Collider collideObMg;//Collider del ObjetoMagico

  /* --- CONSTRUCTORES --- */
  public ObjetoMagico(PVector posicion, int ancho, int alto) {
    this.posicion = posicion;
    this.collideObMg = new Collider(ancho, alto, posicion);//Inicializa el collider segun el ancho, alto y posicion del ObjetoMagico
  }

  /* --- METODOS --- */
  //Metodo para Visualizar el objetoMagico
  void display() {
    noStroke();
    fill(90, 193, 106);
    ellipse(posicion.x, posicion.y, 30, 30);
  }

  //Metodo para detectar una colison con Jugador
  boolean colision(Jugador jugador) {
    return jugador.getCollideJugador().colision(getCollideObMg());//Verificia la colision entre el collider de ObjetoMagico con Jugador
  }

  /* --- METODOS ACCESORES --- */
  public Collider getCollideObMg() {
    return collideObMg;
  }

  public PVector getPosicion() {
    return posicion;
  }

  void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}
