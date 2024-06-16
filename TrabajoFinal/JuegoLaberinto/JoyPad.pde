class JoyPad {
  /* --- ATRIBUTOS --- */
  //Establece el ESTADO del Joypad
  private boolean up;//Arriba
  private boolean down;//Abajo
  private boolean left;//Izquierda
  private boolean right;//Derecha

  /* --- METODOS ACCESORES --- */
  void setUp(boolean up) {
    this.up = up;
  }

  public boolean isUp() {
    return this.up;
  }

  void setDown(boolean down) {
    this.down = down;
  }

  public boolean isDown() {
    return this.down;
  }

  void setLeft(boolean left) {
    this.left = left;
  }

  public boolean isLeft() {
    return this.left;
  }

  void setRight(boolean right) {
    this.right = right;
  }

  public boolean isRight() {
    return this.right;
  }
}
