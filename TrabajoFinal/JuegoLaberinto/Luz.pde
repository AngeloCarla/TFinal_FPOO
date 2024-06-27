class Luz {
  private boolean encendida;
  private int duracion;
  private int tiempoActivacion;

  public Luz(int duracion) {
    this.encendida = false;
    this.duracion = duracion;
  }

  public void activar() {
    encendida = true;
    tiempoActivacion = millis();
  }

  public void actualizar() {
    if (encendida) {
      if (millis() - tiempoActivacion > duracion) {
        encendida = false;
      }
    }
  }

  public void mostrar(PVector posicion) {
    if (encendida) {
      fill(250, 240, 149, 100);
      ellipse(posicion.x, posicion.y, 50, 50);
    }
  }
}
