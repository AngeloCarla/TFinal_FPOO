class Hud implements IVisualizable {
  /* Clase que se encarga de visualizar el Hud en pantalla, Tiempo de Juego */
  /* --- ATRIBUTOS --- */
  private int tiempoInicial; // Establece el tiempo inicial del juego en milisegundos
  private int duracion;      // Duración total del contador en milisegundos
  private int tiempoRestante; // Tiempo restante del juego en milisegundos

  /* --- CONSTRUCTORES --- */
  public Hud() {
    duracion = 60 * 1000;  // Establece la duración en 1 minuto (60 segundos)
    reiniciarTiempo();     // Inicializa el tiempo inicial
  }

  /* --- METODOS --- */
  // Método para visualizar el Hud
  void display() {
    mostrarTiempo(); // Muestra el tiempo en pantalla
  }

  // Método para mostrar el Tiempo en el juego
  void mostrarTiempo() {
    textAlign(CENTER);
    textSize(20);
    fill(255);
    tiempoRestante = duracion - (millis() - tiempoInicial); // Calcula el tiempo restante

    if (tiempoRestante < 0) {
      tiempoRestante = 0; // Asegura que el tiempo restante no sea negativo
    }

    int segundos = tiempoRestante / 1000; // Calcula los segundos restantes

    if (estado == MaquinaEstados.jugando) {
      text("Tiempo: " + segundos / 60 + ":" + segundos % 60, width/2, 30); // Muestra el tiempo en pantalla mientras el juego esté en el estado JUGANDO
    }
    if (tiempoRestante <= 0) {
      estado = MaquinaEstados.perdiendo;
      reiniciarJuego();
    }
  }
  // Método para restablecer el tiempo
  void reiniciarTiempo() {
    tiempoInicial = millis();
  }
}
