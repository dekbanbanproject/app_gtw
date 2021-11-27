import 'dart:convert';

class GleaveModel {
  final String ID;
  final String LEAVE_YEAR_ID;
  final String LEAVE_BECAUSE;
  final String LEAVE_DATE_BEGIN;
  final String LEAVE_DATE_END;
  final String LEAVE_PERSON_FULLNAME;
  final String LEADER_PERSON_ID;
  final String LEAVE_WORK_SEND_ID;
  final String LEAVE_WORK_SEND;
  final String LEAVE_TYPE_CODE;
  final String LEAVE_TYPE_NAME;
  final String LEAVE_STATUS_CODE;
  final String LOCATION_NAME;
  GleaveModel({
    required this.ID,
    required this.LEAVE_YEAR_ID,
    required this.LEAVE_BECAUSE,
    required this.LEAVE_DATE_BEGIN,
    required this.LEAVE_DATE_END,
    required this.LEAVE_PERSON_FULLNAME,
    required this.LEADER_PERSON_ID,
    required this.LEAVE_WORK_SEND_ID,
    required this.LEAVE_WORK_SEND,
    required this.LEAVE_TYPE_CODE,
    required this.LEAVE_TYPE_NAME,
    required this.LEAVE_STATUS_CODE,
    required this.LOCATION_NAME,
  });

  GleaveModel copyWith({
    String? ID,
    String? LEAVE_YEAR_ID,
    String? LEAVE_BECAUSE,
    String? LEAVE_DATE_BEGIN,
    String? LEAVE_DATE_END,
    String? LEAVE_PERSON_FULLNAME,
    String? LEADER_PERSON_ID,
    String? LEAVE_WORK_SEND_ID,
    String? LEAVE_WORK_SEND,
    String? LEAVE_TYPE_CODE,
    String? LEAVE_TYPE_NAME,
    String? LEAVE_STATUS_CODE,
    String? LOCATION_NAME,
  }) {
    return GleaveModel(
      ID: ID ?? this.ID,
      LEAVE_YEAR_ID: LEAVE_YEAR_ID ?? this.LEAVE_YEAR_ID,
      LEAVE_BECAUSE: LEAVE_BECAUSE ?? this.LEAVE_BECAUSE,
      LEAVE_DATE_BEGIN: LEAVE_DATE_BEGIN ?? this.LEAVE_DATE_BEGIN,
      LEAVE_DATE_END: LEAVE_DATE_END ?? this.LEAVE_DATE_END,
      LEAVE_PERSON_FULLNAME:
          LEAVE_PERSON_FULLNAME ?? this.LEAVE_PERSON_FULLNAME,
      LEADER_PERSON_ID: LEADER_PERSON_ID ?? this.LEADER_PERSON_ID,
      LEAVE_WORK_SEND_ID: LEAVE_WORK_SEND_ID ?? this.LEAVE_WORK_SEND_ID,
      LEAVE_WORK_SEND: LEAVE_WORK_SEND ?? this.LEAVE_WORK_SEND,
       LEAVE_TYPE_CODE: LEAVE_TYPE_CODE ?? this.LEAVE_TYPE_CODE,
      LEAVE_TYPE_NAME: LEAVE_TYPE_NAME ?? this.LEAVE_TYPE_NAME,
      LEAVE_STATUS_CODE: LEAVE_STATUS_CODE ?? this.LEAVE_STATUS_CODE,
      LOCATION_NAME: LOCATION_NAME ?? this.LOCATION_NAME,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'LEAVE_YEAR_ID': LEAVE_YEAR_ID,
      'LEAVE_BECAUSE': LEAVE_BECAUSE,
      'LEAVE_DATE_BEGIN': LEAVE_DATE_BEGIN,
      'LEAVE_DATE_END': LEAVE_DATE_END,
      'LEAVE_PERSON_FULLNAME': LEAVE_PERSON_FULLNAME,
      'LEADER_PERSON_ID': LEADER_PERSON_ID,
      'LEAVE_WORK_SEND_ID': LEAVE_WORK_SEND_ID,
      'LEAVE_WORK_SEND': LEAVE_WORK_SEND,
      'LEAVE_TYPE_CODE': LEAVE_TYPE_CODE,
      'LEAVE_TYPE_NAME': LEAVE_TYPE_NAME,
      'LEAVE_STATUS_CODE': LEAVE_STATUS_CODE,
      'LOCATION_NAME': LOCATION_NAME,
    };
  }

  factory GleaveModel.fromMap(Map<String, dynamic> map) {
    return GleaveModel(
      ID: map['ID'] == null ? '' : map['ID'],
      LEAVE_YEAR_ID: map['LEAVE_YEAR_ID'] == null ? '' : map['LEAVE_YEAR_ID'],
      LEAVE_BECAUSE: map['LEAVE_BECAUSE'] == null ? '' : map['LEAVE_BECAUSE'],
      LEAVE_DATE_BEGIN: map['LEAVE_DATE_BEGIN'] == null ? '' : map['LEAVE_DATE_BEGIN'],
      LEAVE_DATE_END: map['LEAVE_DATE_END'] == null ? '' : map['LEAVE_DATE_END'],
      LEAVE_PERSON_FULLNAME: map['LEAVE_PERSON_FULLNAME'] == null ? '' : map['LEAVE_PERSON_FULLNAME'],
      LEADER_PERSON_ID: map['LEADER_PERSON_ID'] == null ? '' : map['LEADER_PERSON_ID'],
      LEAVE_WORK_SEND_ID: map['LEAVE_WORK_SEND_ID'] == null ? '' : map['LEAVE_WORK_SEND_ID'],
      LEAVE_WORK_SEND: map['LEAVE_WORK_SEND'] == null ? '' : map['LEAVE_WORK_SEND'],
      LEAVE_TYPE_CODE: map['LEAVE_TYPE_CODE'] == null ? '' : map['LEAVE_TYPE_CODE'],
      // LEAVE_TYPE_CODE: map['LEAVE_TYPE_CODE'] == null ? '' : int.parse(map['LEAVE_TYPE_CODE']),
      LEAVE_TYPE_NAME: map['LEAVE_TYPE_NAME'] == null ? '' : map['LEAVE_TYPE_NAME'],
      LEAVE_STATUS_CODE: map['LEAVE_STATUS_CODE'] == null ? '' : map['LEAVE_STATUS_CODE'],
      LOCATION_NAME: map['LOCATION_NAME'] == null ? '' : map['LOCATION_NAME'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GleaveModel.fromJson(String source) =>
      GleaveModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GleaveModel(ID:$ID,LEAVE_YEAR_ID: $LEAVE_YEAR_ID, LEAVE_BECAUSE: $LEAVE_BECAUSE, LEAVE_DATE_BEGIN: $LEAVE_DATE_BEGIN, LEAVE_DATE_END: $LEAVE_DATE_END,LEAVE_PERSON_FULLNAME:$LEAVE_PERSON_FULLNAME,LEADER_PERSON_ID:$LEADER_PERSON_ID,LEAVE_WORK_SEND_ID:$LEAVE_WORK_SEND_ID,LEAVE_WORK_SEND:$LEAVE_WORK_SEND,LEAVE_TYPE_CODE:$LEAVE_TYPE_CODE,LEAVE_TYPE_NAME:$LEAVE_TYPE_NAME,LEAVE_STATUS_CODE:$LEAVE_STATUS_CODE,LOCATION_NAME:$LOCATION_NAME)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GleaveModel &&
        other.ID == ID &&
        other.LEAVE_YEAR_ID == LEAVE_YEAR_ID &&
        other.LEAVE_BECAUSE == LEAVE_BECAUSE &&
        other.LEAVE_DATE_BEGIN == LEAVE_DATE_BEGIN &&
        other.LEAVE_DATE_END == LEAVE_DATE_END &&
        other.LEAVE_PERSON_FULLNAME == LEAVE_PERSON_FULLNAME &&
        other.LEADER_PERSON_ID == LEADER_PERSON_ID &&
        other.LEAVE_WORK_SEND_ID == LEAVE_WORK_SEND_ID &&
        other.LEAVE_WORK_SEND == LEAVE_WORK_SEND &&
        other.LEAVE_TYPE_CODE == LEAVE_TYPE_CODE &&
        other.LEAVE_TYPE_NAME == LEAVE_TYPE_NAME &&
        other.LEAVE_STATUS_CODE == LEAVE_STATUS_CODE &&
        other.LOCATION_NAME == LOCATION_NAME;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        LEAVE_YEAR_ID.hashCode ^
        LEAVE_BECAUSE.hashCode ^
        LEAVE_DATE_BEGIN.hashCode ^
        LEAVE_DATE_END.hashCode ^
        LEAVE_PERSON_FULLNAME.hashCode ^
        LEADER_PERSON_ID.hashCode ^
        LEAVE_WORK_SEND_ID.hashCode ^
        LEAVE_WORK_SEND.hashCode ^
        LEAVE_TYPE_CODE.hashCode ^
        LEAVE_TYPE_NAME.hashCode ^
        LEAVE_STATUS_CODE.hashCode ^
        LOCATION_NAME.hashCode;
  }
}
