class ObjetoMagico implements IVisualizable, IPosicionable {
  /* --- ATRIBUTOS --- */
  private PVector posicion;//Posicion de las gemas
  private int tamano; //Tamaño de las gemas

  /* --- CONSTRUCTORES --- */
  public ObjetoMagico(PVector posicion, int tamano) {
    this.posicion = posicion;
    this.tamano = tamano;
  }

  /* --- METODOS --- */
  //Metodo para Visualizar el objetoMagico
  void display() {
    noStroke();
    fill(90, 193, 106);
    ellipse(this.posicion.x, this.posicion.y, tamano, tamano);
  }

  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return posicion;
  }

  void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
  
  public int getTamano() {
    return tamano;
  }
}
