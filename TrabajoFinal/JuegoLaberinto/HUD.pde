class Hud implements IVisualizable {
  /* Clase que se encarga de visualizar el Hud en pantalla, Tiempo de Juego */
  /* --- ATRIBUTOS --- */
  private int tiempoInicial;//Establece el tiempo inicial del juego
  private int tiempo;//Establece el tiempo del juego

  /* --- CONSTRUCTORES --- */
  public Hud() {
    tiempoInicial = millis();//Establece el valor actual en milisegundos
  }

  /* --- METODOS --- */
  //Metodo la visualizar el Hud
  void display() {
    hud.mostrarTiempo();
  }

  //Metodo para mostrar el Tiempo en el juego
  void mostrarTiempo() {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    tiempo = (millis() - tiempoInicial) / 1000; //Calcula el tiempo transcurrido
    if (estado==MaquinaEstados.jugando) {
      text("Tiempo: " + tiempo + "s", 150, 30);//Muestra el tiempo en pantalla miestras el juego este en el esatdo JUGANDO
    }
  }

  // Método para restablecer el tiempo
  void reiniciarTiempo() {
    tiempoInicial = millis();
  }
}
