class UserData {
  User user;
  String token;

  UserData({this.user, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String id;
  String idSalesforce;
  String name;
  String birthdate;
  String email;
  List<String> permissions;

  User(
      {this.id,
      this.idSalesforce,
      this.name,
      this.birthdate,
      this.email,
      this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSalesforce = json['idSalesforce'];
    name = json['name'];
    birthdate = json['birthdate'];
    email = json['email'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idSalesforce'] = this.idSalesforce;
    data['name'] = this.name;
    data['birthdate'] = this.birthdate;
    data['email'] = this.email;
    data['permissions'] = this.permissions;
    return data;
  }
}
