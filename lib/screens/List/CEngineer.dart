class CEngineer{
  //amdjasn
  int id;
  String name;
  String email;
  String telephone;

  CEngineer({this.id, this.name,this.email,this.telephone});

  factory CEngineer.fromJson(Map<String,dynamic>json){
    return  CEngineer(
      id:json["id"] as int,
      name: json["nombre"] as String,
      email: json["email"] as String,
      telephone: json ["telephone"] as String,
    );
  }
}