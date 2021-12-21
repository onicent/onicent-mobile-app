class Favorite {
  String? idCrypto;
  String? id;

  Favorite({this.idCrypto, this.id});

  Favorite.fromJson(Map<String, dynamic> json) {
    idCrypto = json['idCrypto'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCrypto'] = this.idCrypto;
    data['id'] = this.id;
    return data;
  }
}
