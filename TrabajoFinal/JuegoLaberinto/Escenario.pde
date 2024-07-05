class Escenario {
  private PImage bordeI;
  private PImage bordeS;

  public Escenario() {
    bordeI = loadImage("bordeI.png");
    bordeS = loadImage("bordeS.png");
  }

  public void display() {
    dibujarBordeS();//Borde Superior del Laberinto
    dibujarBordeI();//Borde Inferior del Laberinto
    activarOscuridad();
    player.display();//Muestra al Jugador
    hud.display();//Muestra el Hud
  }

  //Metodo que dibuja el borde Superior del Laberinto
  void dibujarBordeS() {
    imageMode(CENTER);
    noTint();//No colorea la imagen
    image(bordeS, width/2, height/2, 600, 600);
  }

  //Metodo que dibuja el borde Inferior del Laberinto
  void dibujarBordeI() {
    noTint();//Permite que no se coloree la imagen
    imageMode(CENTER);
    image(bordeI, width/2, height/2, 600, 600);
  }

  void activarOscuridad() {
    fill(0, 200);
    rect(0, 0, width, height);
  }
}
