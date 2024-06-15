class Collider {
  private int ancho;
  private int alto;
  private PVector posicion;

  public Collider(int ancho, int alto, PVector posicion) {
    this.ancho = ancho;
    this.alto = alto;
    this.posicion = posicion;
  }

  boolean colision(Collider otro) {
    float otroX = otro.getPosicion().x;
    float otroY = otro.getPosicion().y;
    float otroAncho = otro.getAncho();
    float otroAlto = otro.getAlto();

    float colliderX = this.posicion.x;
    float colliderY = this.posicion.y;
    float colliderAncho = this.ancho;
    float colliderAlto = this.alto;

    boolean colisionX = colliderX < otroX + otroAncho && colliderX + colliderAncho > otroX;
    boolean colisionY = colliderY < otroY + otroAlto && colliderY + colliderAlto > otroY;

    return colisionX && colisionY;
  }

  public int getAncho() {
    return this.ancho;
  }

  public void setAlto(int alto) {
    this.alto=alto;
  }

  public int getAlto() {
    return this.alto;
  }

  public void setAncho(int ancho) {
    this.ancho=ancho;
  }

  public PVector getPosicion() {
    return this.posicion;
  }
}
