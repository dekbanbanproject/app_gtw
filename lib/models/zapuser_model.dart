import 'dart:convert';

class Zapusermodel {
  late String zapid;
  late String zapfullname;
  late String zapusername;
  late String zappassword;
  late String zapemail;
  late String zaptype;
  late String personid;
  late String positionid;
  late String depsubsubid;
  late String createdat;
  late String updatedat;
  Zapusermodel({
    required this.zapid,
    required this.zapfullname,
    required this.zapusername,
    required this.zappassword,
    required this.zapemail,
    required this.zaptype,
    required this.personid,
    required this.positionid,
    required this.depsubsubid,
    required this.createdat,
    required this.updatedat,
  });

  Zapusermodel copyWith({
    String? zapid,
    String? zapfullname,
    String? zapusername,
    String? zappassword,
    String? zapemail,
    String? zaptype,
    String? personid,
    String? positionid,
    String? depsubsubid,
    String? createdat,
    String? updatedat,
  }) {
    return Zapusermodel(
      zapid: zapid ?? this.zapid,
      zapfullname: zapfullname ?? this.zapfullname,
      zapusername: zapusername ?? this.zapusername,
      zappassword: zappassword ?? this.zappassword,
      zapemail: zapemail ?? this.zapemail,
      zaptype: zaptype ?? this.zaptype,
      personid: personid ?? this.personid,
      positionid: positionid ?? this.positionid,
      depsubsubid: depsubsubid ?? this.depsubsubid,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'zapid': zapid,
      'zapfullname': zapfullname,
      'zapusername': zapusername,
      'zappassword': zappassword,
      'zapemail': zapemail,
      'zaptype': zaptype,
      'personid': personid,
      'positionid': positionid,
      'depsubsubid': depsubsubid,
      'createdat': createdat,
      'updatedat': updatedat,
    };
  }

  factory Zapusermodel.fromMap(Map<String, dynamic> map) {
    return Zapusermodel(
      zapid: map['zapid'],
      zapfullname: map['zapfullname'],
      zapusername: map['zapusername'],
      zappassword: map['zappassword'],
      zapemail: map['zapemail'],
      zaptype: map['zaptype'],
      personid: map['personid'],
      positionid: map['positionid'],
      depsubsubid: map['depsubsubid'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Zapusermodel.fromJson(String source) =>
      Zapusermodel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Zapusermodel(zapid: $zapid, zapfullname: $zapfullname, zapusername: $zapusername, zappassword: $zappassword, zapemail: $zapemail, zaptype:$zaptype,createdat:$createdat,updatedat:$updatedat,personid:$personid,positionid:$positionid,depsubsubid:$depsubsubid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Zapusermodel &&
        other.zapid == zapid &&
        other.zapfullname == zapfullname &&
        other.zapusername == zapusername &&
        other.zappassword == zappassword &&
        other.zapemail == zapemail &&
        other.zaptype == zaptype &&
        other.personid == personid &&
        other.positionid == positionid && 
        other.depsubsubid == depsubsubid && 
        other.createdat == createdat &&
        other.updatedat == updatedat;
  }

  @override
  int get hashCode =>
      zapid.hashCode ^
      zapfullname.hashCode ^
      zapusername.hashCode ^
      zappassword.hashCode ^
      zapemail.hashCode ^
      zaptype.hashCode ^
      personid.hashCode ^
      positionid.hashCode ^
      depsubsubid.hashCode ^
      createdat.hashCode ^
      updatedat.hashCode;
}
