class UserFields {
  static final List<String> values = [
    id, name, username, email, phone, image, password
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String username = 'username';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String image = 'image';
  static const String password = 'password';
}

class User {
  static const String table = 'users';

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? image;
  final String? password;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.password,
  });

  User copy({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? image,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        image: image ?? this.image,
      );

  static User fromJson(json) => User(
        id: json[UserFields.id] as int?,
        name: json[UserFields.name] as String?,
        username: json[UserFields.username] as String?,
        email: json[UserFields.email] as String?,
        phone: json[UserFields.phone] as String?,
        image: json[UserFields.image] as String?,
        password: json[UserFields.password] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
        'image': image,
        'password': password,
      };
}
