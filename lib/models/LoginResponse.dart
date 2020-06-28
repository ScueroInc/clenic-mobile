class LoginResponse {
  String usuarioId;
  String nombre;
  String sessionToken;
  String perfil;
  int personaId;
  LoginResponse(
      {
        this.usuarioId,
        this.nombre,
        this.sessionToken,
        this.perfil,
        this.personaId,
      });

  LoginResponse.fromJson(Map<String, dynamic> Json) {
    usuarioId = Json['usuarioId'];
    nombre = Json['nombre'];
    sessionToken = Json['sessionToken'];
    perfil = Json['perfil'];
    personaId = Json['personaId'];
  }

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