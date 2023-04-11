import 'package:personal_finance_tcc/presenter/models/ports/model.dart';

class AccountTypeFields {
  static final List<String> values = [
    id,
    name,
    slug,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String slug = 'slug';
}

class AccountType extends Model<AccountType> {
  static const String table = 'account_types';

  final int? id;
  final String? name;
  final String? slug;

  AccountType({
    this.id,
    this.name,
    this.slug,
  });

  @override
  AccountType copy({
    int? id,
    String? name,
    String? slug,
  }) =>
      AccountType(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );

  @override
  AccountType fromJson(json) => AccountType(
        id: json[AccountTypeFields.id] as int?,
        name: json[AccountTypeFields.name] as String?,
        slug: json[AccountTypeFields.slug] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };
}
