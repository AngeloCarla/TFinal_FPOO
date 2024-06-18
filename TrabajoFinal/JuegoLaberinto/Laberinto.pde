class Laberinto {
  /* --- ATRIBUTOS --- */
  private int filas, columnas;//Dimensiones del laberinto
  private int[][] laberinto;//Matriz para almacenar el laberinto
  private int tamanoCelda;//Tamaño de las celdas del laberinto

  /* --- CONSTRUCTORES --- */
  public Laberinto(int filas, int columnas, int tamanoCelda) {
    this.filas = filas;
    this.columnas = columnas;
    this.tamanoCelda = tamanoCelda;
    laberinto = new int[filas][columnas];
    generarLaberinto();
  }

  /* --- MÉTODOS --- */
  //Metodo para generar el laberinto
  private void generarLaberinto() {
    for (int i = 0; i < filas; i++) {
      for (int j = 0; j < columnas; j++) {
        laberinto[i][j] = 1; // Pared
      }
    }
    int x = 1;
    int y = 1;
    laberinto[x][y] = 0; //Espacio libre
    generarCamino(x, y);
  }

  //Metodo para generar el camino del laberinto
  private void generarCamino(int x, int y) {
    int[] dx = {1, -1, 0, 0};
    int[] dy = {0, 0, 1, -1};
    int[] orden = {0, 1, 2, 3};
    reordenarLaberinto(orden); //Mezcla el orden de las direcciones

    for (int i = 0; i < 4; i++) {
      int nx = x + dx[orden[i]] * 2;
      int ny = y + dy[orden[i]] * 2;
      if (nx > 0 && ny > 0 && nx < filas - 1 && ny < columnas - 1 && laberinto[nx][ny] == 1) {
        laberinto[nx - dx[orden[i]]][ny - dy[orden[i]]] = 0;
        laberinto[nx][ny] = 0;
        generarCamino(nx, ny);
      }
    }
  }

  //Metodo que aleteoriza la generacion del Laberinto
  private void reordenarLaberinto(int[] array) {
    for (int i = array.length - 1; i > 0; i--) {
      int index = (int)(Math.random() * (i + 1));
      int temp = array[index];
      array[index] = array[i];
      array[i] = temp;
    }
  }

  // Método para mostrar el laberinto
  void display() {
    for (int i = 0; i < filas; i++) {
      for (int j = 0; j < columnas; j++) {
        if (laberinto[i][j] == 1) {
          fill(0);
          rect(j * tamanoCelda, i * tamanoCelda, tamanoCelda, tamanoCelda);
        }
      }
    }
  }

  /* --- METODOS ACCESORES --- */
  public int getTamanoCelda() {
    return tamanoCelda;
  }
}
