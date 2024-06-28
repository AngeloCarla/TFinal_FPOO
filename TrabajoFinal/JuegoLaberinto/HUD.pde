class Hud {
  /* --- ATRIBUTOS --- */
  private int tiempoInicial;//Establece el tiempo inicial del juego
  private int tiempo;//Establece el tiempo del juego

  /* --- CONSTRUCTORES --- */
  public Hud() {
    tiempoInicial = millis();//Establece el valor actual en milisegundos
  }

  /* --- METODOS --- */
  //Metodo para mostrar la Vida del JUGADOR
  void mostrarVida(Jugador player) {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Vidas: " + player.vida, 50, 25);
  }

  //Metodo para mostrar el Tiempo en el juego
  void mostrarTiempo() {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    tiempo = (millis() - tiempoInicial) / 1000; //Calcula el tiempo transcurrido
    if (estado==MaquinaEstados.jugando) {
      text("Tiempo: " + tiempo + "s", 150, 25);
      if (tiempo > 60) {
        estado = MaquinaEstados.perdiendo;
      }
    }
  }
  // Método para restablecer el tiempo
  void reiniciarTiempo() {
    tiempoInicial = millis();
  }
  
  void display(){
    hud.mostrarVida(player);
    hud.mostrarTiempo();
  }
}
