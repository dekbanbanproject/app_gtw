// To parse this JSON data, do
//
//     final chartsuppliesreq = chartsuppliesreqFromJson(jsonString);

import 'dart:convert';

List<Chartsuppliesreq> chartsuppliesreqFromJson(String str) => List<Chartsuppliesreq>.from(json.decode(str).map((x) => Chartsuppliesreq.fromJson(x)));

String chartsuppliesreqToJson(List<Chartsuppliesreq> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chartsuppliesreq {
    Chartsuppliesreq({
        required this.id,
        required this.budgetSum,
        required this.dateWant,
    });

    String id;
    String budgetSum;
    DateTime? dateWant;

    factory Chartsuppliesreq.fromJson(Map<String, dynamic> json) => Chartsuppliesreq(
        id: json["ID"] == null ? null : json["ID"],
        budgetSum: json["BUDGET_SUM"] == null ? null : json["BUDGET_SUM"],
        dateWant: json["DATE_WANT"] == null ? null : DateTime.parse(json["DATE_WANT"]),
    );

  get DATE_WANT => null;

    Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "BUDGET_SUM": budgetSum == null ? null : budgetSum,
        "DATE_WANT": dateWant == null ? null : "${dateWant!.year.toString().padLeft(4, '0')}-${dateWant!.month.toString().padLeft(2, '0')}-${dateWant!.day.toString().padLeft(2, '0')}",
    };
}
