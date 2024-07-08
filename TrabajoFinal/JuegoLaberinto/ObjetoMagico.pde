class ObjetoMagico implements IVisualizable, IPosicionable {
  /* --- ATRIBUTOS --- */
  private PVector posicion; //Posicion de las gemas
  private PImage gema; //Imagen de las gemas
  private int tamano; //Tamaño de las gemas

  /* --- CONSTRUCTORES --- */
  public ObjetoMagico(PVector posicion, int tamano) {
    this.posicion = posicion;
    this.tamano = tamano;
    gema = loadImage("gema.png");
  }

  /* --- METODOS --- */
  //Metodo para Visualizar el objetoMagico
  void display() {
    image(gema, posicion.x, posicion.y, tamano, tamano);
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
