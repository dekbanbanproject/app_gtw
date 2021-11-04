import 'dart:convert';

class DevhnModel {
  final String ID;
  final String BOOK_NUM;
  final String RECORD_HEAD;
  final String USER_POST_NAME;
  final String DATE_GO;
  final String DATE_BACK;
  final String RECORD_HEAD_USE;
  final String STATUS;
  final String RECORD_TYPE_NAME;
  final String LOCATION_ORG_NAME;
  final String RECORD_GO_NAME;
  final String RECORD_LEVEL_NAME;
  final String LEADER_HR_ID;
  final String OFFER_WORK_HR_NAME;
  final String WITHDRAW_NAME;
  final String RECORD_VEHICLE_NAME;
  DevhnModel({
    required this.ID,
    required this.BOOK_NUM,
    required this.RECORD_HEAD,
    required this.USER_POST_NAME,
    required this.DATE_GO,
    required this.DATE_BACK,
    required this.RECORD_HEAD_USE,
    required this.STATUS,
    required this.RECORD_TYPE_NAME,
    required this.LOCATION_ORG_NAME,
    required this.RECORD_GO_NAME,
    required this.RECORD_LEVEL_NAME,
    required this.LEADER_HR_ID,
    required this.OFFER_WORK_HR_NAME,
    required this.WITHDRAW_NAME,
    required this.RECORD_VEHICLE_NAME,
  });

  DevhnModel copyWith({
    String? ID,
    String? BOOK_NUM,
    String? RECORD_HEAD,
    String? USER_POST_NAME,
    String? DATE_GO,
    String? DATE_BACK,
    String? RECORD_HEAD_USE,
    String? STATUS,
    String? RECORD_TYPE_NAME,
    String? LOCATION_ORG_NAME,
    String? RECORD_GO_NAME,
    String? RECORD_LEVEL_NAME,
    String? LEADER_HR_ID,
    String? OFFER_WORK_HR_NAME,
    String? WITHDRAW_NAME,
    String? RECORD_VEHICLE_NAME,
  }) {
    return DevhnModel(
      ID: ID ?? this.ID,
      BOOK_NUM: BOOK_NUM ?? this.BOOK_NUM,
      RECORD_HEAD: RECORD_HEAD ?? this.RECORD_HEAD,
      USER_POST_NAME: USER_POST_NAME ?? this.USER_POST_NAME,
      DATE_GO: DATE_GO ?? this.DATE_GO,
      DATE_BACK: DATE_BACK ?? this.DATE_BACK,
      RECORD_HEAD_USE: RECORD_HEAD_USE ?? this.RECORD_HEAD_USE,
      STATUS: STATUS ?? this.STATUS,
      RECORD_TYPE_NAME: RECORD_TYPE_NAME ?? this.RECORD_TYPE_NAME,
      LOCATION_ORG_NAME: LOCATION_ORG_NAME ?? this.LOCATION_ORG_NAME,
      RECORD_GO_NAME: RECORD_GO_NAME ?? this.RECORD_GO_NAME,
      RECORD_LEVEL_NAME: RECORD_LEVEL_NAME ?? this.RECORD_LEVEL_NAME,
      LEADER_HR_ID: LEADER_HR_ID ?? this.LEADER_HR_ID,
      OFFER_WORK_HR_NAME: OFFER_WORK_HR_NAME ?? this.OFFER_WORK_HR_NAME,
      WITHDRAW_NAME: WITHDRAW_NAME ?? this.WITHDRAW_NAME,
      RECORD_VEHICLE_NAME: RECORD_VEHICLE_NAME ?? this.RECORD_VEHICLE_NAME,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'BOOK_NUM': BOOK_NUM,
      'RECORD_HEAD': RECORD_HEAD,
      'USER_POST_NAME': USER_POST_NAME,
      'DATE_GO': DATE_GO,
      'DATE_BACK': DATE_BACK,
      'RECORD_HEAD_USE': RECORD_HEAD_USE,
      'STATUS': STATUS,
      'RECORD_TYPE_NAME': RECORD_TYPE_NAME,
      'LOCATION_ORG_NAME': LOCATION_ORG_NAME,
      'RECORD_GO_NAME': RECORD_GO_NAME,
      'RECORD_LEVEL_NAME': RECORD_LEVEL_NAME,
      'LEADER_HR_ID': LEADER_HR_ID,
      'OFFER_WORK_HR_NAME': OFFER_WORK_HR_NAME,
      'WITHDRAW_NAME': WITHDRAW_NAME,
      'RECORD_VEHICLE_NAME': RECORD_VEHICLE_NAME,
    };
  }

  factory DevhnModel.fromMap(Map<String, dynamic> map) {
    return DevhnModel(
      ID: map['ID'] == null ? '' : map['ID'],
      BOOK_NUM: map['BOOK_NUM'] == null ? '' : map['BOOK_NUM'],
      RECORD_HEAD: map['RECORD_HEAD'] == null ? '' : map['RECORD_HEAD'],
      USER_POST_NAME: map['USER_POST_NAME'] == null ? '' : map['USER_POST_NAME'],
      DATE_GO: map['DATE_GO'] == null ? '' : map['DATE_GO'],
      DATE_BACK: map['DATE_BACK'] == null ? '' : map['DATE_BACK'],
      RECORD_HEAD_USE: map['RECORD_HEAD_USE'] == null ? '' : map['RECORD_HEAD_USE'],
      STATUS: map['STATUS'] == null ? '' : map['STATUS'],
      RECORD_TYPE_NAME: map['RECORD_TYPE_NAME'] == null ? '' : map['RECORD_TYPE_NAME'],
      LOCATION_ORG_NAME: map['LOCATION_ORG_NAME'] == null ? '' : map['LOCATION_ORG_NAME'],
      RECORD_GO_NAME: map['RECORD_GO_NAME'] == null ? '' : map['RECORD_GO_NAME'],
      RECORD_LEVEL_NAME: map['RECORD_LEVEL_NAME'] == null ? '' : map['RECORD_LEVEL_NAME'],
      LEADER_HR_ID: map['LEADER_HR_ID'] == null ? '' : map['LEADER_HR_ID'],
      OFFER_WORK_HR_NAME: map['OFFER_WORK_HR_NAME'] == null ? '' : map['OFFER_WORK_HR_NAME'],
      WITHDRAW_NAME: map['WITHDRAW_NAME'] == null ? '' : map['WITHDRAW_NAME'],
      RECORD_VEHICLE_NAME: map['RECORD_VEHICLE_NAME'] == null ? '' : map['RECORD_VEHICLE_NAME'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DevhnModel.fromJson(String source) => DevhnModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DevhnModel(ID: $ID, BOOK_NUM: $BOOK_NUM, RECORD_HEAD: $RECORD_HEAD, USER_POST_NAME: $USER_POST_NAME, DATE_GO: $DATE_GO, DATE_BACK: $DATE_BACK, RECORD_HEAD_USE: $RECORD_HEAD_USE, STATUS: $STATUS, RECORD_TYPE_NAME: $RECORD_TYPE_NAME, LOCATION_ORG_NAME: $LOCATION_ORG_NAME, RECORD_GO_NAME: $RECORD_GO_NAME, RECORD_LEVEL_NAME: $RECORD_LEVEL_NAME,LEADER_HR_ID:$LEADER_HR_ID,OFFER_WORK_HR_NAME:$OFFER_WORK_HR_NAME,WITHDRAW_NAME:$WITHDRAW_NAME,RECORD_VEHICLE_NAME:$RECORD_VEHICLE_NAME)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DevhnModel &&
      other.ID == ID &&
      other.BOOK_NUM == BOOK_NUM &&
      other.RECORD_HEAD == RECORD_HEAD &&
      other.USER_POST_NAME == USER_POST_NAME &&
      other.DATE_GO == DATE_GO &&
      other.DATE_BACK == DATE_BACK &&
      other.RECORD_HEAD_USE == RECORD_HEAD_USE &&
      other.STATUS == STATUS &&
      other.RECORD_TYPE_NAME == RECORD_TYPE_NAME &&
      other.LOCATION_ORG_NAME == LOCATION_ORG_NAME &&
      other.RECORD_GO_NAME == RECORD_GO_NAME &&
      other.LEADER_HR_ID == LEADER_HR_ID &&
      other.OFFER_WORK_HR_NAME == OFFER_WORK_HR_NAME &&
      other.WITHDRAW_NAME == WITHDRAW_NAME &&
      other.RECORD_VEHICLE_NAME == RECORD_VEHICLE_NAME &&
      other.RECORD_LEVEL_NAME == RECORD_LEVEL_NAME;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
      BOOK_NUM.hashCode ^
      RECORD_HEAD.hashCode ^
      USER_POST_NAME.hashCode ^
      DATE_GO.hashCode ^
      DATE_BACK.hashCode ^
      RECORD_HEAD_USE.hashCode ^
      STATUS.hashCode ^
      RECORD_TYPE_NAME.hashCode ^
      LOCATION_ORG_NAME.hashCode ^
      RECORD_GO_NAME.hashCode ^
      LEADER_HR_ID.hashCode ^
      OFFER_WORK_HR_NAME.hashCode ^
      WITHDRAW_NAME.hashCode ^
      RECORD_VEHICLE_NAME.hashCode ^
      RECORD_LEVEL_NAME.hashCode;
  }
}
