class Iluminador {
  /* Clase que se encarga del Iluminador, objeto que ilumina al jugador al presionar la tecla 'e' */
  /* --- ATRIBUTOS --- */
  private boolean encendida;//Indica si el Iluminador esta encendida o apagada
  private int duracion;//Duracion en la que permanece encendido (en milisegundos)
  private int tiempoActivacion;//Tiempo de Activacion de la luz

  /* --- CONSTRUICTORES --- */
  public Iluminador(int duracion) {
    /*
    @param duracion -> Duración en milisegundos que el Iluminador permanecerá activo
     */
    this.encendida = false;//Inicialmente el Iluminador esta apagado
    this.duracion = duracion;//Asigna la duracion del Iluminador
  }

  /* --- METODOS --- */
  //Metodo para activar el poder
  public void activar() {
    encendida = true;//Activa el poder
    tiempoActivacion = millis();//Registra el tiempo de Activacion
  }

  //Metodo para actualizar el estador del poder
  public void actualizar() {
    if (encendida) {
      //Si el Iluminador esta encendido y supera la durcaion, se apaga
      if (millis() - tiempoActivacion > duracion) {
        encendida = false;
      }
    }
  }

  //Metodo para mostrar el poder en base a la posicion del Jugador
  public void mostrar(PVector posicion) {
  //  if (encendida) {//Si el Iluminador esta encendidio se dibuja un ellipse alrededor del Jugador y del ObjetoMagico simulando una Luz
      stroke(255);
      ellipseMode(CENTER);
      noFill();//R, G, B, value transparecia
      ellipse(posicion.x, posicion.y, 50, 50);
    //}
  }
}
