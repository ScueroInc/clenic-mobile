class EjemplarResponse {
  String nombreModelo;
  int ejemplarId;
  int numeroSerieEjemplar;
  EjemplarResponse(
      {
        this.nombreModelo,
        this.ejemplarId,
        this.numeroSerieEjemplar,
      });
/*Para recibir un JSON y convertirlo a objeto*/
  EjemplarResponse.fromJson(Map<String, dynamic> Json) {
    nombreModelo = Json['nombreModelo'];
    ejemplarId = Json['ejemplarId'];
    numeroSerieEjemplar = Json['numeroSerieEjemplar'];
  }
}