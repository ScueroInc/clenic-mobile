class PlacesResponse {
  String nombreSede;
  String nombreCliente;
  String direccion;
  String correo;
  int numContacto;
  int lugarClienteId;


  PlacesResponse(
      {
        this.nombreSede,
        this.nombreCliente,
        this.direccion,
        this.correo,
        this.numContacto,
        this.lugarClienteId,
      });
/*Para recibir un JSON y convertirlo a objeto*/
  PlacesResponse.fromJson(Map<String, dynamic> Json) {
    nombreSede = Json['nombreSede'];
    nombreCliente = Json['nombreCliente'];
    direccion = Json['direccion'];
    correo = Json['correo'];
    numContacto = Json['numContacto'];
    lugarClienteId = Json['lugarClienteId'];
  }

}