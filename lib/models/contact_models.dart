import '../constants/user_colum_models.dart';

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

  Contact();

  Contact.fromMap(Map map) {
    id = map[UserColumn().idColumn];
    name = map[UserColumn().nameColumn];
    email = map[UserColumn().emailColumn];
    phone = map[UserColumn().phoneColumn];
    img = map[UserColumn().imgColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      UserColumn().nameColumn: name,
      UserColumn().emailColumn: email,
      UserColumn().phoneColumn: phone,
      UserColumn().imgColumn: img
    };
    if (id != null) {
      map[UserColumn().idColumn] = id;
    }
    return map;
  }
}
