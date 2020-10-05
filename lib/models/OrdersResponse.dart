class OrdersResponse{
  int ordenId;
  String nombreIngeniero;
  String seriesEjemplar;
  String serviciosNombre;
  String estado;

  int lugar_PersonasId;
  int clienteId;
  String nombreCliente;
  String direccionLugar;
  String correoCliente;

  OrdersResponse(
      {
        this.ordenId,
        this.nombreIngeniero,
        this.seriesEjemplar,
        this.serviciosNombre,
        this.estado,

        this.lugar_PersonasId,
        this.clienteId,
        this.nombreCliente,
        this.direccionLugar,
        this.correoCliente,
      });

  OrdersResponse.fromJson(Map<String, dynamic> Json) {
    ordenId = Json['ordenId'];
    estado = Json['estado'];
    lugar_PersonasId = Json['lugar_PersonasId'];
    clienteId = Json['clienteId'];
    nombreCliente = Json['nombreCliente'];
    direccionLugar = Json['direccionLugar'];
    correoCliente = Json['correoCliente'];
    nombreIngeniero = Json['nombreIngeniero'];
    seriesEjemplar = Json['seriesEjemplar'];
    serviciosNombre = Json['serviciosNombre'];

  }

}