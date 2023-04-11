import 'package:personal_finance_tcc/presenter/models/ports/model.dart';

class AccountFields {
  static final List<String> values = [
    id,
    name,
    balance,
    accountTypeId,
    institutionId
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String balance = 'balance';
  static const String accountTypeId = 'account_type_id';
  static const String institutionId = 'institution_id';
}

class Account extends Model<Account> {
  static const String table = 'accounts';

  final int? id;
  final String? name;
  final String? balance;
  final int? accountTypeId;
  final int? institutionId;

  Account({
    this.id,
    this.name,
    this.balance,
    this.accountTypeId,
    this.institutionId,
  });

  @override
  Account copy({
    int? id,
    String? name,
    String? balance,
    int? accountTypeId,
    int? institutionId,
  }) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        balance: balance ?? this.balance,
        accountTypeId: accountTypeId ?? this.accountTypeId,
        institutionId: institutionId ?? this.institutionId,
      );

  @override
  Account fromJson(json) => Account(
        id: json[AccountFields.id] as int?,
        name: json[AccountFields.name] as String?,
        balance: json[AccountFields.balance] as String?,
        accountTypeId: json[AccountFields.accountTypeId] as int?,
        institutionId: json[AccountFields.institutionId] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        AccountFields.id: id,
        AccountFields.name: name,
        AccountFields.balance: balance,
        AccountFields.accountTypeId: accountTypeId,
        AccountFields.institutionId: institutionId,
      };
}
