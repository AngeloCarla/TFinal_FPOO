class Laberinto implements IVisualizable {
  /* --- ATRIBUTOS --- */
  private PVector posicion;
  private PImage laberinto;
  private ArrayList<Collider> collideLab;

  /* --- CONSTRUCTORES --- */
  public Laberinto() {
    laberinto = loadImage("laberinto.png");
    // Calcular la posición del collider del laberinto
    posicion = new PVector(width/2, height/2);
    
    float colliderX = posicion.x;// Ajustar según sea necesario
    float colliderY = posicion.y; // Ajustar según sea necesario

    // Crear el collider del laberinto y agregarlo al ArrayList
    collideLab = new ArrayList<Collider>();
    
    collideLab.add(new Collider(70, 26, new PVector(colliderX, colliderY)));
  }

  /* --- METODOS --- */
  public void display() {
    //imageMode(CENTER);
    image(laberinto, posicion.x, posicion.y, 600, 600);

  }

  /* --- METODOS ACCESORES --- */

  public ArrayList<Collider> getCollideLab() {
    return collideLab;
  }

  public PVector getPosicion() {
    return posicion;
  }

  void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}
