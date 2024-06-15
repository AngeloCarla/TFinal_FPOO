static class Time {

  /* --- METODO ESTATICO --- */
  static float getDeltaTime(float frame) {
    int framePorSegundo = round(frame);
    float deltaTime = 1.0/framePorSegundo;
    return deltaTime;
  }
}
