class Laberinto implements IVisualizable {
  /* --- ATRIBUTOS --- */
  private int line, bs;//Celdas y Ancho de las paredes del Laberinto
  private PVector posicion;
  private Collider collideLaberinto;

  /* --- CONSTRUCTORES --- */
  public Laberinto() {
    bs = 60;
    line = 3;
    posicion = new PVector(35, 140);
    collideLaberinto = new Collider(bs, line, posicion);
  }

  /* --- METODOS --- */
  public void display() {
    noStroke();
    fill(15, 180, 60);
    //HORIZONTAL
    rect(posicion.x + bs, posicion.y + bs, bs, line);//1.1
    rect(posicion.x + bs*4, posicion.y + bs, bs, line);//1.2
    rect(posicion.x + bs*6, posicion.y + bs, bs*2, line);//1.3
    rect(posicion.x, posicion.y + bs*2, bs*7, line);//2.1
    rect(posicion.x + bs*8, posicion.y + bs*2, bs, line);//2.2
    rect(posicion.x + bs, posicion.y + bs*3, bs, line);//3.1
    rect(posicion.x + bs*6, posicion.y + bs*3, bs*2, line);//3.2
    rect(posicion.x + bs*2, posicion.y + bs*4, bs*2, line);//4.1
    rect(posicion.x + bs*5, posicion.y + bs*4, bs*3, line);//4.2
    rect(posicion.x, posicion.y + bs*5, bs*5, line);//5.1
    rect(posicion.x + bs*6, posicion.y + bs*5, bs, line);//5.2
    rect(posicion.x + bs*8, posicion.y + bs*5, bs, line);//5.3
    rect(posicion.x + bs*2, posicion.y + bs*6, bs, line);//6.1
    rect(posicion.x + bs*4, posicion.y + bs*6, bs*4, line);//6.2

    //VERTICAl
    fill(16, 129, 47);
    rect(posicion.x + bs, posicion.y + bs*2, line, bs);//1.1
    rect(posicion.x + bs, posicion.y + bs*4, line, bs*2);//1.2
    rect(posicion.x + bs*2, posicion.y, line, bs);//2.1
    rect(posicion.x + bs*2, posicion.y + bs*3, line, bs);//2.2
    rect(posicion.x + bs*2, posicion.y + bs*6, line, bs);//2.3
    rect(posicion.x + bs*3, posicion.y + bs, line, bs*2);//3.2
    rect(posicion.x + bs*4, posicion.y, line, bs);//4.1
    rect(posicion.x + bs*4, posicion.y + bs*3, line, bs);//4.2
    rect(posicion.x + bs*4, posicion.y + bs*5, line, bs);//4.3
    rect(posicion.x + bs*5, posicion.y + bs*2, line, bs);//5.1
    rect(posicion.x + bs*6, posicion.y + bs*3, line, bs);//6.1
    rect(posicion.x + bs*7, posicion.y + bs, line, bs);//7.1
    rect(posicion.x + bs*7, posicion.y + bs*5, line, bs);//7.2
    rect(posicion.x + bs*8, posicion.y + bs*4, line, bs);//8.1 
  }

  public boolean colision(Collider colliderJugador) {
    // Verificar colisión entre el collider del jugador y el collider del laberinto
    return collideLaberinto.colision(colliderJugador);
  }

  /* --- METODOS ACCESORES --- */
  public Collider getCollideLaberinto() {
    return collideLaberinto;
  }

  public PVector getPosicion() {
    return posicion;
  }

  void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  public int getBs() {
    return bs;
  }

  public int getLine() {
    return line;
  }
}
