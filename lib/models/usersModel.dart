import 'dart:convert';

class UsersModel {
  String id;
  String fullname;
  String username;
  String password;
  String email;
  String type;
  String personid;
  String positionid;
  String depsubsubid;

  UsersModel({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.email,
    required this.type,
    required this.personid,
    required this.positionid,
    required this.depsubsubid,
  });


  UsersModel copyWith({
    String? id,
    String? fullname,
    String? username,
    String? password,
    String? email,
    String? type,
    String? personid,
    String? positionid,
    String? depsubsubid,
  }) {
    return UsersModel(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      type: type ?? this.type,
      personid: personid ?? this.personid,
      positionid: positionid ?? this.positionid,
      depsubsubid: depsubsubid ?? this.depsubsubid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'username': username,
      'password': password,
      'email': email,
      'type': type,
      'personid': personid,
      'positionid': positionid,
      'depsubsubid': depsubsubid,
    };
  }



  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] == null ? '' : map['id'],
      fullname: map['fullname'] == null ? '' : map['fullname'],
      username: map['username'] == null ? '' : map['username'],
      password: map['password'] == null ? '' : map['password'],
      email: map['email'] == null ? '' : map['email'],
      type: map['type'] == null ? '' : map['type'],
      personid: map['personid'] == null ? '' : map['personid'],
      positionid: map['positionid'] == null ? '' : map['positionid'],
      depsubsubid: map['depsubsubid'] == null ? '' : map['depsubsubid'],
    );
  }
  // Map<String, dynamic> myMap = new Map<String, dynamic>.from(/*Your Source*/ );

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsersModel(id: $id, fullname: $fullname, username: $username, password: $password, email: $email, type: $type, personid: $personid, positionid: $positionid, depsubsubid: $depsubsubid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsersModel &&
        other.id == id &&
        other.fullname == fullname &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.type == type &&
        other.personid == personid &&
        other.positionid == positionid &&
        other.depsubsubid == depsubsubid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        type.hashCode ^
        personid.hashCode ^
        positionid.hashCode ^
        depsubsubid.hashCode;
  }
}
