class Laberinto implements IVisualizable {
  /* --- ATRIBUTOS --- */
  private PImage laberinto; //Imagen del laberinto
  private ArrayList<Collider> collideLab; //Almacena las colisiones para los muros

  /* --- CONSTRUCTORES --- */
  public Laberinto() {
    laberinto = loadImage("laberinto.png");
    collideLab = new ArrayList<Collider>();

    //Colisiones para los muros en HORIZONTAL
    collideLab.add(new Collider(70, 8, new PVector(105, 210)));//1.1
    collideLab.add(new Collider(60, 8, new PVector(278, 210)));//1.2
    collideLab.add(new Collider(110, 8, new PVector(400, 210)));//1.3
    collideLab.add(new Collider(410, 8, new PVector(50, 270)));//2.1
    collideLab.add(new Collider(90, 6, new PVector(520, 270)));//2.2
    collideLab.add(new Collider(65, 6, new PVector(110, 330)));//3.1
    collideLab.add(new Collider(112, 6, new PVector(390, 330)));//3.2
    collideLab.add(new Collider(115, 4, new PVector(175, 385)));//4.1
    collideLab.add(new Collider(160, 4, new PVector(350, 385)));//4.2
    collideLab.add(new Collider(285, 4, new PVector(50, 435)));//5.1
    collideLab.add(new Collider(55, 4, new PVector(400, 435)));//5.2
    collideLab.add(new Collider(55, 4, new PVector(500, 435)));//5.3
    collideLab.add(new Collider(45, 5, new PVector(175, 495)));//6.1
    collideLab.add(new Collider(220, 5, new PVector(276, 495)));//6.2

    //Colisiones para los muros en VERTICAL
    collideLab.add(new Collider(8, 60, new PVector(165, 150)));//1.1
    collideLab.add(new Collider(8, 60, new PVector(279, 150)));//1.2
    collideLab.add(new Collider(8, 50, new PVector(224, 225)));//2.1
    collideLab.add(new Collider(8, 50, new PVector(447, 225)));//2.2
    collideLab.add(new Collider(8, 40, new PVector(115, 270)));//3.1
    collideLab.add(new Collider(4, 40, new PVector(340, 270)));//3.2
    collideLab.add(new Collider(4, 50, new PVector(170, 320)));//4.1
    collideLab.add(new Collider(4, 50, new PVector(280, 340)));//4.2
    collideLab.add(new Collider(4, 50, new PVector(392, 340)));//4.3
    collideLab.add(new Collider(4, 50, new PVector(115, 395)));//5.1
    collideLab.add(new Collider(4, 50, new PVector(506, 395)));//5.2
    collideLab.add(new Collider(4, 50, new PVector(280, 440)));//6.1
    collideLab.add(new Collider(3, 50, new PVector(446, 440)));//6.2
    collideLab.add(new Collider(4, 50, new PVector(176, 510)));//7.1
  }

  /* --- METODOS --- */
  public void display() {
    image(laberinto, width/2, height/2, 600, 600);
  }

  /* --- METODOS ACCESORES --- */
  public ArrayList<Collider> getCollideLab() {
    return collideLab;
  }
}
