class Escenario {
  private PImage bordeI; //Imagen del borde inferior del laberinto
  private PImage bordeS; //Imagen del borde inferior del laberinto
  private ArrayList<ObjetoMagico> gemas; //Arraylist para almacenar las gemas 

  public Escenario() {
    bordeI = loadImage("bordeI.png");
    bordeS = loadImage("bordeS.png");
    gemas = new ArrayList<ObjetoMagico>();
  }

  public void display() {
    for (ObjetoMagico g : gemas) {
      g.display(); //Muestra las gemas en el escenario
    }
    dibujarBordeS();//Borde Superior del Laberinto
    dibujarBordeI();//Borde Inferior del Laberinto
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
  
  /**Agrega las gemas en el Arraylist*/
  void agregarGemas(ObjetoMagico g) {
    gemas.add(g);
  }
  
  /**Metodo que al momento de hacer colision con alguna gema desaparezca*/
  void recolectarGemas(Jugador jugador) {
    for (int i = gemas.size() - 1; i >= 0; i--) {
      if (jugador.recolectarGemas(gemas.get(i))) {
        gemas.remove(i);
      }
    }
  }
}
