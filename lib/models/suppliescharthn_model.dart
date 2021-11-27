class SupplieschartHnModel {

  // late final String LEAVE_YEAR_ID;
  late final String DATE_WANT;
  late final double BUDGET_SUM;

  SupplieschartHnModel(
    
      {
      // required this.LEAVE_YEAR_ID,
      required this.DATE_WANT,
      required this.BUDGET_SUM});

  factory SupplieschartHnModel.fromMap(Map<String, dynamic> map) {
    return SupplieschartHnModel(
    
        // LEAVE_YEAR_ID: map["LEAVE_YEAR_ID"],
        DATE_WANT: map["DATE_WANT"],
        BUDGET_SUM: double.parse(map["BUDGET_SUM"]));
  }
}