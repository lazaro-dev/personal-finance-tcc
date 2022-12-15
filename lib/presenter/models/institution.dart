class InstitutionFields {
  static final List<String> values = [
    id,
    name,
    image,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String image = 'image';
}

class Institution {
  static const String table = 'institutions';

  final int? id;
  final String? name;
  final String? image;

  Institution({
    this.id,
    this.name,
    this.image,
  });

  Institution copy({
    int? id,
    String? name,
    String? image,
  }) =>
      Institution(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  static Institution fromJson(json) => Institution(
        id: json[InstitutionFields.id] as int?,
        name: json[InstitutionFields.name] as String?,
        image: json[InstitutionFields.image] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
