class LoginModel {
  String? nome;
  String? mail;
  String? password;
  bool? keepom;

  LoginModel({this.nome, this.mail, this.password, this.keepom});

  LoginModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    mail = json['mail'];
    password = json['password'];
    keepom = json['keepom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['keepom'] = this.keepom;
    return data;
  }
}
