class User {
  final String username;

  User({
    required this.username,
  });

  static User fromJson(json) => User(
        username: json['username'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
