class Escenario {
  /* --- ATRIBUTOS --- */
  private Hud hud;//Clase HUD
  private Laberinto laberinto;//Clase Laberinto

  /* --- CONSTRUCTORES --- */
  public Escenario() {
    hud = new Hud();//Inicializacion de Hud
    laberinto = new Laberinto(25, 25, 25);//Inicializacion de Laberinto
  }

  /* --- METODOS --- */
  //Metodo para VISUALIZAR el Escenario
  void display() {
    hud.mostrarVida();//Llama al metodo mostrarVida de HUD
    hud.mostrarTiempo();//Llama al metodo mostrarTiempo de HUD
    laberinto.display();//Llama al metodo display de Laberinto
  }
}
