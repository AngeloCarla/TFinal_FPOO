class Hud implements IVisualizable {
  /* Clase que se encarga de visualizar el Hud en pantalla, Tiempo de Juego */

  /* --- ATRIBUTOS --- */
  private int tiempoInicial; // Establece el tiempo inicial del juego en milisegundos
  private int tiempoTranscurrido; // Duración total del contador en milisegundos

  /* --- CONSTRUCTORES --- */
  public Hud() {
    reiniciarTiempo(); // Inicializa el tiempo inicial
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

    if (estado == MaquinaEstados.jugando) {
      tiempoTranscurrido = millis() - tiempoInicial; // Calcula el tiempo transcurrido desde el inicio del juego
      int tiempo = tiempoTranscurrido / 1000; // Convierte el tiempo a segundos

      // Verifica si el tiempo ha superado los 30 segundos
      if (tiempo > 30) {
        estado = MaquinaEstados.perdiendo; // Cambia el estado a perdiendo si el tiempo supera los 30 segundos
      }

      text(tiempo + "s", 310, 30); // Muestra el tiempo transcurrido en pantalla
    }

    if (estado == MaquinaEstados.ganando || estado == MaquinaEstados.perdiendo) {
      int tiempo = tiempoTranscurrido / 1000; // Calcula los segundos transcurridos
      text("Tiempo Final: " + tiempo, width/2, 200); // Muestra el tiempo final en pantalla
    }
  }

  // Método para restablecer el tiempo
  void reiniciarTiempo() {
    tiempoInicial = millis(); // Establece el tiempo inicial en el momento actual
    tiempoTranscurrido = 0; // Resetea el tiempo transcurrido
  }

  /* --- METODOS ACCESORES --- */
  int getTiempoTranscurrido() {
    return tiempoTranscurrido; // Devuelve el tiempo transcurrido
  }
}
