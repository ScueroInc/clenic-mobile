class EngineersResponse{
  int ingenieroId;
  String nombre;
  String direccion;
  String correo;
  int numeroContacto;
  String dni;
  double cordX;
  double cordY;

  EngineersResponse(
      {
        this.ingenieroId,
        this.nombre,
        this.direccion,
        this.correo,
        this.numeroContacto,
        this.dni,
        this.cordX,
        this.cordY,
      });

  EngineersResponse.fromJson(Map<String, dynamic> Json) {
    ingenieroId = Json['ingenieroId'];
    nombre = Json['nombre'];
    direccion = Json['direccion'];
    correo = Json['correo'];
    numeroContacto = Json['numeroContacto'];
    dni = Json['dni'];
    cordX = Json['cordX'];
    cordY = Json['cordY'];
  }

}