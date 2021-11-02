import 'dart:convert';

class Infousers_model {
  late String id;
  late String fullname;
  late String username;
  late String password;
  late String email;
  late String type;
  late String personid;
  late String positionid;
  late String depsubsubid;
  late String created_at;
  late String updated_at;
  Infousers_model({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.email,
    required this.type,
    required this.personid,
    required this.positionid,
    required this.depsubsubid,
    required this.created_at,
    required this.updated_at,
  });

  Infousers_model copyWith({
    String? id,
    String? fullname,
    String? username,
    String? password,
    String? email,
    String? type,
    String? personid,
    String? positionid,
    String? depsubsubid,
    String? created_at,
    String? updated_at,
  }) {
    return Infousers_model(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      type: type ?? this.type,
      personid: personid ?? this.personid,
      positionid: positionid ?? this.positionid,
      depsubsubid: depsubsubid ?? this.depsubsubid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
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
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Infousers_model.fromMap(Map<String, dynamic> map) {
    return Infousers_model(
      id: map['id'],
      fullname: map['fullname'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
      type: map['type'],
      personid: map['personid'],
      positionid: map['positionid'],
      depsubsubid: map['depsubsubid'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Infousers_model.fromJson(String source) =>
      Infousers_model.fromMap(json.decode(source));

  @override
  String toString() =>
      'Infousers_model(id: $id, fullname: $fullname, username: $username, password: $password, email: $email, type:$type,created_at:$created_at,updated_at:$updated_at,personid:$personid,positionid:$positionid,depsubsubid:$depsubsubid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Infousers_model &&
        other.id == id &&
        other.fullname == fullname &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.type == type &&
        other.personid == personid &&
        other.positionid == positionid && 
        other.depsubsubid == depsubsubid && 
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullname.hashCode ^
      username.hashCode ^
      password.hashCode ^
      email.hashCode ^
      type.hashCode ^
      personid.hashCode ^
      positionid.hashCode ^
      depsubsubid.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
}
