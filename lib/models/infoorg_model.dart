import 'dart:convert';

class InfoOrgModels {
    final String ORG_ID;
    final String ORG_NAME;
    // final String img_logo;

  InfoOrgModels({
    required this.ORG_ID,
    required this.ORG_NAME,
    // required this.img_logo,
   
  });
InfoOrgModels copyWith({
    String? ORG_ID,
    String? ORG_NAME,
    // String? img_logo,
 
  }) {
    return InfoOrgModels(
      ORG_ID: ORG_ID ?? this.ORG_ID,
      ORG_NAME: ORG_NAME ?? this.ORG_NAME,
      // img_logo: img_logo ?? this.img_logo,
    
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'ORG_ID': ORG_ID,
      'ORG_NAME': ORG_NAME,
      // 'img_logo': img_logo,
    
    };
  }
 factory InfoOrgModels.fromMap(Map<String, dynamic> map) {
    return InfoOrgModels(
      ORG_ID: map['ORG_ID'] == null ? '' : map['ORG_ID'],
      ORG_NAME: map['ORG_NAME'] == null ? '' : map['ORG_NAME'],
      // img_logo: map['img_logo'] == null ? '' : map['img_logo'],
     
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoOrgModels.fromJson(String source) =>
      InfoOrgModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InfoOrgModels(ORG_ID:$ORG_ID,ORG_NAME: $ORG_NAME,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoOrgModels &&
        other.ORG_ID == ORG_ID &&
        other.ORG_NAME == ORG_NAME;
        //  &&
        // other.img_logo == img_logo;
  }

  @override
  int get hashCode {
    return ORG_ID.hashCode ^
        ORG_NAME.hashCode;
        //  ^
        // img_logo.hashCode;
  }
}