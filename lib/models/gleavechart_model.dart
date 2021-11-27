

class GleavechartModel {
  // late final String ID;
  late final String LEAVE_YEAR_ID;
  late final String LEAVE_DATE_BEGIN;
  late final int LEAVE_TYPE_CODE;

  GleavechartModel(
      // {required this.ID,
      {
      required this.LEAVE_YEAR_ID,
      required this.LEAVE_DATE_BEGIN,
      required this.LEAVE_TYPE_CODE});

  factory GleavechartModel.fromMap(Map<String, dynamic> map) {
    return GleavechartModel(
        // ID: map["ID"],
        LEAVE_YEAR_ID: map["LEAVE_YEAR_ID"],
        LEAVE_DATE_BEGIN: map["LEAVE_DATE_BEGIN"],
        LEAVE_TYPE_CODE: int.parse(map["LEAVE_TYPE_CODE"]));
  }
}
