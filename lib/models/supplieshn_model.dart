import 'dart:convert';

class SuppliesHnModels {
  final String ID;
  final String DATE_WANT;
  final String DEP_SUB_SUB_PHONE;
  final String SAVE_HR_NAME;
  final String SAVE_HR_DEP_SUB_NAME;
  final String REQUEST_FOR;
  final String BUDGET_SUM;
  final String STATUS;
  final String BUDGET_YEAR;
  final String REQUEST_BUY_COMMENT;
  final String REQUEST_ID;
  SuppliesHnModels({
    required this.ID,
    required this.DATE_WANT,
    required this.DEP_SUB_SUB_PHONE,
    required this.SAVE_HR_NAME,
    required this.SAVE_HR_DEP_SUB_NAME,
    required this.REQUEST_FOR,
    required this.BUDGET_SUM,
    required this.STATUS,
    required this.BUDGET_YEAR,
    required this.REQUEST_BUY_COMMENT,
     required this.REQUEST_ID,
  });

  SuppliesHnModels copyWith({
    String? ID,
    String? DATE_WANT,
    String? DEP_SUB_SUB_PHONE,
    String? SAVE_HR_NAME,
    String? SAVE_HR_DEP_SUB_NAME,
    String? REQUEST_FOR,
    String? BUDGET_SUM,
    String? STATUS,
    String? BUDGET_YEAR,
    String? REQUEST_BUY_COMMENT,
    String? REQUEST_ID,
  }) {
    return SuppliesHnModels(
      ID: ID ?? this.ID,
      DATE_WANT: DATE_WANT ?? this.DATE_WANT,
      DEP_SUB_SUB_PHONE: DEP_SUB_SUB_PHONE ?? this.DEP_SUB_SUB_PHONE,
      SAVE_HR_NAME: SAVE_HR_NAME ?? this.SAVE_HR_NAME,
      SAVE_HR_DEP_SUB_NAME: SAVE_HR_DEP_SUB_NAME ?? this.SAVE_HR_DEP_SUB_NAME,
      REQUEST_FOR: REQUEST_FOR ?? this.REQUEST_FOR,
      BUDGET_SUM: BUDGET_SUM ?? this.BUDGET_SUM,
      STATUS: STATUS ?? this.STATUS,
      BUDGET_YEAR: BUDGET_YEAR ?? this.BUDGET_YEAR,
      REQUEST_BUY_COMMENT: REQUEST_BUY_COMMENT ?? this.REQUEST_BUY_COMMENT,
       REQUEST_ID: REQUEST_ID ?? this.REQUEST_ID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'DATE_WANT': DATE_WANT,
      'DEP_SUB_SUB_PHONE': DEP_SUB_SUB_PHONE,
      'SAVE_HR_NAME': SAVE_HR_NAME,
      'SAVE_HR_DEP_SUB_NAME': SAVE_HR_DEP_SUB_NAME,
      'REQUEST_FOR': REQUEST_FOR,
      'BUDGET_SUM': BUDGET_SUM,
      'STATUS': STATUS,
      'BUDGET_YEAR': BUDGET_YEAR,
      'REQUEST_BUY_COMMENT': REQUEST_BUY_COMMENT,
      'REQUEST_ID': REQUEST_ID,
    };
  }

  factory SuppliesHnModels.fromMap(Map<String, dynamic> map) {
    return SuppliesHnModels(
      ID: map['ID'] == null ? '' : map['ID'],
      DATE_WANT: map['DATE_WANT'] == null ? '' : map['DATE_WANT'],
      DEP_SUB_SUB_PHONE:
          map['DEP_SUB_SUB_PHONE'] == null ? '' : map['DEP_SUB_SUB_PHONE'],
      SAVE_HR_NAME: map['SAVE_HR_NAME'] == null ? '' : map['SAVE_HR_NAME'],
      SAVE_HR_DEP_SUB_NAME: map['SAVE_HR_DEP_SUB_NAME'] == null
          ? ''
          : map['SAVE_HR_DEP_SUB_NAME'],
      REQUEST_FOR: map['REQUEST_FOR'] == null ? '' : map['REQUEST_FOR'],
      BUDGET_SUM: map['BUDGET_SUM'] == null ? '' : map['BUDGET_SUM'],
      STATUS: map['STATUS'] == null ? '' : map['STATUS'],
      BUDGET_YEAR: map['BUDGET_YEAR'] == null ? '' : map['BUDGET_YEAR'],
      REQUEST_BUY_COMMENT:
          map['REQUEST_BUY_COMMENT'] == null ? '' : map['REQUEST_BUY_COMMENT'],
           REQUEST_ID:
          map['REQUEST_ID'] == null ? '' : map['REQUEST_ID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SuppliesHnModels.fromJson(String source) =>
      SuppliesHnModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuppliesHnModels(ID: $ID, DATE_WANT: $DATE_WANT, DEP_SUB_SUB_PHONE: $DEP_SUB_SUB_PHONE, SAVE_HR_NAME: $SAVE_HR_NAME, SAVE_HR_DEP_SUB_NAME: $SAVE_HR_DEP_SUB_NAME, REQUEST_FOR: $REQUEST_FOR, BUDGET_SUM: $BUDGET_SUM, STATUS: $STATUS, BUDGET_YEAR: $BUDGET_YEAR, REQUEST_BUY_COMMENT: $REQUEST_BUY_COMMENT,REQUEST_ID:$REQUEST_ID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuppliesHnModels &&
        other.ID == ID &&
        other.DATE_WANT == DATE_WANT &&
        other.DEP_SUB_SUB_PHONE == DEP_SUB_SUB_PHONE &&
        other.SAVE_HR_NAME == SAVE_HR_NAME &&
        other.SAVE_HR_DEP_SUB_NAME == SAVE_HR_DEP_SUB_NAME &&
        other.REQUEST_FOR == REQUEST_FOR &&
        other.BUDGET_SUM == BUDGET_SUM &&
        other.STATUS == STATUS &&
        other.BUDGET_YEAR == BUDGET_YEAR &&
         other.REQUEST_ID == REQUEST_ID &&
        other.REQUEST_BUY_COMMENT == REQUEST_BUY_COMMENT;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        DATE_WANT.hashCode ^
        DEP_SUB_SUB_PHONE.hashCode ^
        SAVE_HR_NAME.hashCode ^
        SAVE_HR_DEP_SUB_NAME.hashCode ^
        REQUEST_FOR.hashCode ^
        BUDGET_SUM.hashCode ^
        STATUS.hashCode ^
        BUDGET_YEAR.hashCode ^
        REQUEST_ID.hashCode ^
        REQUEST_BUY_COMMENT.hashCode;
  }
}
