import 'dart:convert';

class BookIndexModel {
  final String BOOK_ID;
  final String BOOK_NUM_IN;
  final String BOOK_NUMBER;
  final String BOOK_NAME;
  final String BOOK_DATE;
  final String BOOK_TYPE_NAME;
  final String BOOK_DETAIL;
  final String SEND_STATUS;
  final String BOOK_SECRET_NAME;
  final String BOOK_YEAR_ID;
  final String INSTANT_NAME;
  final String SEND_LD_BY_HR_ID;
  BookIndexModel({
    required this.BOOK_ID,
    required this.BOOK_NUM_IN,
    required this.BOOK_NUMBER,
    required this.BOOK_NAME,
    required this.BOOK_DATE,
    required this.BOOK_TYPE_NAME,
    required this.BOOK_DETAIL,
    required this.SEND_STATUS,
    required this.BOOK_SECRET_NAME,
    required this.BOOK_YEAR_ID,
    required this.INSTANT_NAME,
    required this.SEND_LD_BY_HR_ID,
  });

  BookIndexModel copyWith({
    String? BOOK_ID,
    String? BOOK_NUM_IN,
    String? BOOK_NUMBER,
    String? BOOK_NAME,
    String? BOOK_DATE,
    String? BOOK_TYPE_NAME,
    String? BOOK_DETAIL,
    String? SEND_STATUS,
    String? BOOK_SECRET_NAME,
    String? BOOK_YEAR_ID,
    String? INSTANT_NAME,
    String? SEND_LD_BY_HR_ID,
  }) {
    return BookIndexModel(
      BOOK_ID: BOOK_ID ?? this.BOOK_ID,
      BOOK_NUM_IN: BOOK_NUM_IN ?? this.BOOK_NUM_IN,
      BOOK_NUMBER: BOOK_NUMBER ?? this.BOOK_NUMBER,
      BOOK_NAME: BOOK_NUMBER ?? this.BOOK_NAME,
      BOOK_DATE: BOOK_DATE ?? this.BOOK_DATE,
      BOOK_TYPE_NAME: BOOK_TYPE_NAME ?? this.BOOK_TYPE_NAME,
      BOOK_DETAIL: BOOK_DETAIL ?? this.BOOK_DETAIL,
      SEND_STATUS: SEND_STATUS ?? this.SEND_STATUS,
      BOOK_SECRET_NAME: BOOK_SECRET_NAME ?? this.BOOK_SECRET_NAME,
      BOOK_YEAR_ID: BOOK_YEAR_ID ?? this.BOOK_YEAR_ID,
      INSTANT_NAME: INSTANT_NAME ?? this.INSTANT_NAME,
       SEND_LD_BY_HR_ID: SEND_LD_BY_HR_ID ?? this.SEND_LD_BY_HR_ID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'BOOK_ID': BOOK_ID,
      'BOOK_NUM_IN': BOOK_NUM_IN,
      'BOOK_NUMBER': BOOK_NUMBER,
      'BOOK_NAME': BOOK_NAME,
      'BOOK_DATE': BOOK_DATE,
      'BOOK_TYPE_NAME': BOOK_TYPE_NAME,
      'BOOK_DETAIL': BOOK_DETAIL,
      'SEND_STATUS': SEND_STATUS,
      'BOOK_SECRET_NAME': BOOK_SECRET_NAME,
      'BOOK_YEAR_ID': BOOK_YEAR_ID,
      'INSTANT_NAME': INSTANT_NAME,
      'SEND_LD_BY_HR_ID': SEND_LD_BY_HR_ID,
    };
  }

  factory BookIndexModel.fromMap(Map<String, dynamic> map) {
    return BookIndexModel(
      BOOK_ID: map['BOOK_ID'] == null ? '' : map['BOOK_ID'],
      BOOK_NUM_IN: map['BOOK_NUM_IN'] == null ? '' : map['BOOK_NUM_IN'],
      BOOK_NUMBER: map['BOOK_NUMBER'] == null ? '' : map['BOOK_NUMBER'],
      BOOK_NAME: map['BOOK_NAME'] == null ? '' : map['BOOK_NAME'],
      BOOK_DATE: map['BOOK_DATE'] == null ? '' : map['BOOK_DATE'],
      BOOK_TYPE_NAME:
          map['BOOK_TYPE_NAME'] == null ? '' : map['BOOK_TYPE_NAME'],
      BOOK_DETAIL: map['BOOK_DETAIL'] == null ? '' : map['BOOK_DETAIL'],
      SEND_STATUS: map['SEND_STATUS'] == null ? '' : map['SEND_STATUS'],
      BOOK_SECRET_NAME:
          map['BOOK_SECRET_NAME'] == null ? '' : map['BOOK_SECRET_NAME'],
      BOOK_YEAR_ID: map['BOOK_YEAR_ID'] == null ? '' : map['BOOK_YEAR_ID'],
      INSTANT_NAME: map['INSTANT_NAME'] == null ? '' : map['INSTANT_NAME'],
      SEND_LD_BY_HR_ID: map['SEND_LD_BY_HR_ID'] == null ? '' : map['SEND_LD_BY_HR_ID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookIndexModel.fromJson(String source) =>
      BookIndexModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookIndexModel(BOOK_ID:$BOOK_ID,BOOK_NUM_IN: $BOOK_NUM_IN, BOOK_NUMBER: $BOOK_NUMBER,BOOK_NAME:$BOOK_NAME, BOOK_DATE: $BOOK_DATE, BOOK_TYPE_NAME: $BOOK_TYPE_NAME,BOOK_DETAIL:$BOOK_DETAIL,SEND_STATUS:$SEND_STATUS,BOOK_SECRET_NAME:$BOOK_SECRET_NAME,BOOK_YEAR_ID:$BOOK_YEAR_ID,INSTANT_NAME:$INSTANT_NAME,SEND_LD_BY_HR_ID:$SEND_LD_BY_HR_ID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookIndexModel &&
        other.BOOK_ID == BOOK_ID &&
        other.BOOK_NUM_IN == BOOK_NUM_IN &&
        other.BOOK_NUMBER == BOOK_NUMBER &&
        other.BOOK_NAME == BOOK_NAME &&
        other.BOOK_DATE == BOOK_DATE &&
        other.BOOK_TYPE_NAME == BOOK_TYPE_NAME &&
        other.BOOK_DETAIL == BOOK_DETAIL &&
        other.SEND_STATUS == SEND_STATUS &&
        other.BOOK_SECRET_NAME == BOOK_SECRET_NAME &&
        other.BOOK_YEAR_ID == BOOK_YEAR_ID &&
        other.INSTANT_NAME == INSTANT_NAME &&
        other.SEND_LD_BY_HR_ID == SEND_LD_BY_HR_ID;
  }

  @override
  int get hashCode {
    return BOOK_ID.hashCode ^
        BOOK_NUM_IN.hashCode ^
        BOOK_NUMBER.hashCode ^
        BOOK_NAME.hashCode ^
        BOOK_DATE.hashCode ^
        BOOK_TYPE_NAME.hashCode ^
        BOOK_DETAIL.hashCode ^
        SEND_STATUS.hashCode ^
        BOOK_SECRET_NAME.hashCode ^
        BOOK_YEAR_ID.hashCode ^
        INSTANT_NAME.hashCode ^
        SEND_LD_BY_HR_ID.hashCode;
  }
}
