class Module {
  int? id;
  int? semester;
  String? name;
  String? shortName;
  String? description;
  Uri? imageUrl;
  int? coef;

  Module({
    this.id,
    this.semester,
    this.name,
    this.shortName,
    this.description,
    this.imageUrl,
    this.coef,
  });

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    semester = json['semester'];
    name = json['name'];
    shortName = json['shortName'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    coef = json['coef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['semester'] = semester;
    data['name'] = name;
    data['shortName'] = shortName;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['coef'] = coef;
    return data;
  }
}
