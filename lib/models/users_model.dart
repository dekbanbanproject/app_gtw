import 'dart:convert';

class UserSModel {
  late String id;
  late String name;
  late String username;
  late String password;
  late String email;
  late String emailverifiedat;
  late String remembertoken;
  late String status;
  late String personid;
  late String createdat;
  late String updatedat;
  late String type;
  UserSModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.status,
    required this.personid,
    required this.emailverifiedat,
    required this.remembertoken,
    required this.createdat,
    required this.updatedat,
    required this.type,
  });

  UserSModel copyWith({
    String? id,
    String? name,
    String? username,
    String? password,
    String? email,
    String? status,
    String? personid,
    String? emailverifiedat,
    String? remembertoken,
    String? createdat,
    String? updatedat,
    String? type,
  }) {
    return UserSModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      status: status ?? this.status,
      personid: personid ?? this.personid,
      emailverifiedat: emailverifiedat ?? this.emailverifiedat,
      remembertoken: remembertoken ?? this.remembertoken,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'email': email,
      'status': status,
      'personid': personid,
      'emailverifiedat': emailverifiedat,
      'remembertoken': remembertoken,
      'createdat': createdat,
      'updatedat': updatedat,
      'type': type,
    };
  }

  factory UserSModel.fromMap(Map<String, dynamic> map) {
    return UserSModel(
      id : map['id'],
      name : map['name'],
      username : map['username'],
      password : map['password'],
      email : map['email'],
      status : map['status'],
      personid : map['PERSON_ID'],
      emailverifiedat : map['email_verified_at'],
      remembertoken : map['remember_token'],
      createdat : map['created_at'],
      updatedat : map['updated_at'],
      type : map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSModel.fromJson(String source) =>
      UserSModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(id: $id, name: $name, username: $username, password: $password, email: $email, status: $status,personid:$personid,emailverifiedat:$emailverifiedat,remembertoken:$remembertoken,createdat:$createdat,updatedat:$updatedat,type:$type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserSModel &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.status == status &&
        other.personid == personid &&
        other.emailverifiedat == emailverifiedat &&
        other.remembertoken == remembertoken &&
        other.createdat == createdat &&
        other.updatedat == updatedat && 
        other.type == type;     
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ username.hashCode ^ password.hashCode ^ email.hashCode ^ status.hashCode ^ personid.hashCode ^ emailverifiedat.hashCode ^ remembertoken.hashCode ^ createdat.hashCode ^ updatedat.hashCode ^ type.hashCode ;
}