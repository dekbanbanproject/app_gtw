import 'dart:convert';

class Sale {
   final int id;
   final String date;
   final int sale;
  Sale({
    required this.id,
    required this.date,
    required this.sale,
  });

  Sale copyWith({
    int? id,
    String? date,
    int? sale,
  }) {
    return Sale(
      id: id ?? this.id,
      date: date ?? this.date,
      sale: sale ?? this.sale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'sale': sale,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      sale: map['sale']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sale.fromJson(String source) => Sale.fromMap(json.decode(source));

  @override
  String toString() => 'Sale(id: $id, date: $date, sale: $sale)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Sale &&
      other.id == id &&
      other.date == date &&
      other.sale == sale;
  }

  @override
  int get hashCode => id.hashCode ^ date.hashCode ^ sale.hashCode;
}
