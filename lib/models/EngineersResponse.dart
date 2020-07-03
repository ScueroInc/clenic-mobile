class OrdersResponse{
  String orderId;
  String estado;
  int lugar_PersonasId;
  int clienteId;
  String nombreCliente;
  String direccionLugar;
  String correoCliente;

  OrdersResponse(
      {
        this.orderId,
        this.estado,
        this.lugar_PersonasId,
        this.clienteId,
        this.nombreCliente,
        this.direccionLugar,
        this.correoCliente,
      });

  OrdersResponse.fromJson(Map<String, dynamic> Json) {
    orderId = Json['orderId'];
    estado = Json['estado'];
    lugar_PersonasId = Json['lugar_PersonasId'];
    clienteId = Json['clienteId'];
    nombreCliente = Json['nombreCliente'];
    direccionLugar = Json['direccionLugar'];
    correoCliente = Json['correoCliente'];
  }

}