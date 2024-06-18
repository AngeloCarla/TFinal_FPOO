static class Time {
/*Esta Clase representa el Calculo del DeltaTime*/
  /* --- METODO ESTATICO --- */
  static float getDeltaTime(float frame) {
    int framePorSegundo = round(frame);
    float deltaTime = 1.0/framePorSegundo;
    return deltaTime;
  }
}
