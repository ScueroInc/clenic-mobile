class LoginResponse {
  String usuarioId;
  String nombre;
  String sessionToken;
  String perfil;
  String correo;
  String numContacto;
  int personaId;

  LoginResponse(
      {
        this.usuarioId,
        this.nombre,
        this.sessionToken,
        this.perfil,
        this.personaId,
        this.correo,
        this.numContacto,
      });
/*Para recibir un JSON y convertirlo a objeto*/
  LoginResponse.fromJson(Map<String, dynamic> Json) {
    usuarioId = Json['usuarioId'];
    nombre = Json['nombre'];
    sessionToken = Json['sessionToken'];
    perfil = Json['perfil'];
    personaId = Json['personaId'];
    correo = Json['correo'];
    numContacto = Json['numContacto'];
  }
/*Para enviar un objeto y convertirlo a JSON*/
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioId'] = this.usuarioId;
    data['nombre'] = this.nombre;
    data['sessionToken'] = this.sessionToken;
    data['perfil'] = this.perfil;
    data['personaId']=this.personaId;
    return data;
  }
}