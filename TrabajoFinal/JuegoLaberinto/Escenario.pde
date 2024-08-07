class Escenario {
  private PImage bordeI; //Imagen del borde inferior del laberinto
  private PImage bordeS; //Imagen del borde inferior del laberinto
  private ArrayList<ObjetoMagico> gemas; //Arraylist para almacenar las gemas
  private int gemasRecolectadas;
  private PImage fondo;

  public Escenario() {
    bordeI = loadImage("bordeI.png");
    bordeS = loadImage("bordeS.png");
    gemas = new ArrayList<ObjetoMagico>();
    gemasRecolectadas = 0;
    fondo = loadImage("fondoEs.png");
  }

  public void display() {
    dibujarFondo();
    dibujarBordeS();//Borde Superior del Laberinto
    dibujarBordeI();//Borde Inferior del Laberinto
    player.display();//Muestra al Jugador
    hud.display();//Muestra el Hud
    
    for (ObjetoMagico g : gemas) {
      g.display(); //Muestra las gemas en el escenario
    }
  }

  //Metodo que dibuja el borde Superior del Laberinto
  void dibujarBordeS() {
    image(bordeS, width/2, height/2, 600, 600);
  }

  //Metodo que dibuja el borde Inferior del Laberinto
  void dibujarBordeI() {
    image(bordeI, width/2, height/2, 600, 600);
  }
  /**Dibuja el fondo del laberinto*/
  void dibujarFondo(){
    noTint();
    imageMode(CENTER);
    image(fondo, width/2, height/2, 600, 600);
  }

  /**Agrega las gemas en el Arraylist*/
  void agregarGemas(ObjetoMagico g) {
    gemas.add(g);
    gemasRecolectadas++;
  }

  /**Metodo que al momento de hacer colision con alguna gema desaparezca*/
  void recolectarGemas(Jugador jugador) {
    for (int i = gemas.size() - 1; i >= 0; i--) {
      if (jugador.recolectarGemas(gemas.get(i))) {
        gemas.remove(i);
        gemasRecolectadas--;
      }
    }

    // Verificar si se han recolectado todas las gemas
    if (gemasRecolectadas <= 0) {
      // Cambiar el estado a ganando
      estado = MaquinaEstados.ganando;
    }
  }
}
