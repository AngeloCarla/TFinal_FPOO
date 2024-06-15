class Hud {
  /* --- ATRIBUTOS --- */
  private int tiempoInicial;
  private int tiempo;

  /* --- CONSTRUCTORES --- */
  public Hud() {
    tiempoInicial = millis();
  }
  /* --- METODOS --- */
  void display() {
    mostrarVida();
    mostrarTiempo();
  }

  void mostrarVida() {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Vidas: " + player.vida, 100, 30);
  }

  void mostrarTiempo() {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    tiempo = (millis() - tiempoInicial) / 1000;
    if (estado==MaquinaEstados.jugando) {
      text("Tiempo: " + tiempo + "s", 200, 30);
    }
  }
}
