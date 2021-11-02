class ModuleModel {
  late String id;
  late String name;
  late String createdat;
  late String updatedat;
  ModuleModel({
    required this.id,
    required this.name,
    required this.createdat,
    required this.updatedat,
  });
  ModuleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdat;
    data['updated_at'] = this.updatedat;

    return data;
  }
}
