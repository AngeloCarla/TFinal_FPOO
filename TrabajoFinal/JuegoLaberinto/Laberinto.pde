class Laberinto implements IVisualizable {
  /* --- ATRIBUTOS --- */
  private int line, bs;//Celdas y Ancho de las paredes del Laberinto
  private PVector posicion;
  private Collider collideLaberinto;
  private PImage celdaHorizontal;
  private PImage celdaVertical;

  /* --- CONSTRUCTORES --- */
  public Laberinto() {
    bs = 60;
    line = 3;
    posicion = new PVector(35, 140);
    collideLaberinto = new Collider(bs, line, posicion);
    celdaHorizontal = loadImage("horizontal.png");
    celdaVertical = loadImage("vertical.png");
    celdaHorizontal.resize(1350,200);//Tamaño de la imagen
    celdaVertical.resize(400,1200);//Tamaño de la imagen
  }

  /* --- METODOS --- */
  public void display() {
    //noStroke();
    //fill(15, 180, 60);
    //HORIZONTAL
    image(celdaHorizontal,posicion.x + bs+25, posicion.y + bs-5);//1.1  
    image(celdaHorizontal,posicion.x + bs*4+20, posicion.y + bs-5);//1.2
    image(celdaHorizontal,posicion.x + bs*6+25, posicion.y + bs-5);//1.3
    image(celdaHorizontal,posicion.x + bs*6+80, posicion.y + bs-5);//1.4
    image(celdaHorizontal,posicion.x+30, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x+100, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x+170, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x+242, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x+313, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x+385, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x + bs*8+25, posicion.y + bs*2-5);
    image(celdaHorizontal,posicion.x + bs+20, posicion.y + bs*3-5);
    image(celdaHorizontal,posicion.x + bs*6+25, posicion.y + bs*3-5);
    image(celdaHorizontal,posicion.x + bs*6+80, posicion.y + bs*3-5);
    image(celdaHorizontal,posicion.x + bs*2+20, posicion.y + bs*4-5);
    image(celdaHorizontal,posicion.x + bs*2+80, posicion.y + bs*4-5);
    image(celdaHorizontal,posicion.x + bs*5+25, posicion.y + bs*4-5);
    image(celdaHorizontal,posicion.x + bs*5+80, posicion.y + bs*4-5);
    image(celdaHorizontal,posicion.x + bs*5+140, posicion.y + bs*4-5);
    image(celdaHorizontal,posicion.x+25, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x+80, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x+140, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x+200, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x+260, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x + bs*6+25, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x + bs*8+20, posicion.y + bs*5-5);
    image(celdaHorizontal,posicion.x + bs*2+25, posicion.y + bs*6-5);
    image(celdaHorizontal,posicion.x + bs*4+20, posicion.y + bs*6-5);
    image(celdaHorizontal,posicion.x + bs*4+80, posicion.y + bs*6-5);
    image(celdaHorizontal,posicion.x + bs*4+140, posicion.y + bs*6-5);
    image(celdaHorizontal,posicion.x + bs*4+200, posicion.y + bs*6-5);
    
    /**rect(posicion.x + bs, posicion.y + bs, bs, line);//1.1
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
    rect(posicion.x + bs*4, posicion.y + bs*6, bs*4, line);//6.2*/

    //VERTICAl
    //fill(16, 129, 47);
    image(celdaVertical,posicion.x + bs-3, posicion.y + bs*2-30);//1.1  
    image(celdaVertical,posicion.x + bs-3, posicion.y + bs*4-35);
    image(celdaVertical,posicion.x + bs*2-3, posicion.y-30);
    image(celdaVertical,posicion.x + bs*2-3, posicion.y + bs*3-30);
    image(celdaVertical,posicion.x + bs*2-3, posicion.y + bs*6-30);
    image(celdaVertical,posicion.x + bs*3-3, posicion.y + bs-25);
    image(celdaVertical,posicion.x + bs*4-3, posicion.y-30);
    image(celdaVertical,posicion.x + bs*4-7.5, posicion.y + bs*3-30);
    image(celdaVertical,posicion.x + bs*4-3, posicion.y + bs*5-30);
    image(celdaVertical,posicion.x + bs*5-3, posicion.y + bs*2-25);
    image(celdaVertical,posicion.x + bs*6-3, posicion.y + bs*3-30);
    image(celdaVertical,posicion.x + bs*7-3, posicion.y + bs-25);
    image(celdaVertical,posicion.x + bs*7-3, posicion.y + bs*5-30);
    image(celdaVertical,posicion.x + bs*8-3, posicion.y + bs*4-30);
    
    //rect(posicion.x + bs, posicion.y + bs*2, line, bs);//1.1
    //rect(posicion.x + bs, posicion.y + bs*4, line, bs*2);//1.2
    //rect(posicion.x + bs*2, posicion.y, line, bs);//2.1
    //rect(posicion.x + bs*2, posicion.y + bs*3, line, bs);//2.2
    //rect(posicion.x + bs*2, posicion.y + bs*6, line, bs);//2.3
    //rect(posicion.x + bs*3, posicion.y + bs, line, bs*2);//3.2
    //rect(posicion.x + bs*4, posicion.y, line, bs);//4.1
    //rect(posicion.x + bs*4, posicion.y + bs*3, line, bs);//4.2
    //rect(posicion.x + bs*4, posicion.y + bs*5, line, bs);//4.3
    //rect(posicion.x + bs*5, posicion.y + bs*2, line, bs);//5.1
    //rect(posicion.x + bs*6, posicion.y + bs*3, line, bs);//6.1
    //rect(posicion.x + bs*7, posicion.y + bs, line, bs);//7.1
    //rect(posicion.x + bs*7, posicion.y + bs*5, line, bs);//7.2
    //rect(posicion.x + bs*8, posicion.y + bs*4, line, bs);//8.1 
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
