class AccountFields {
  static final List<String> values = [
    id,
    name,
    balance,
    accountTypeId,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String balance = 'balance';
  static const String accountTypeId = 'account_type_id';
}

class Account {
  static const String table = 'accounts';

  final int? id;
  final String? name;
  final String? balance;
  final int? accountTypeId;

  Account({
    this.id,
    this.name,
    this.balance,
    this.accountTypeId,
  });

  Account copy({
    int? id,
    String? name,
    String? balance,
    int? accountTypeId,
  }) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        balance: balance ?? this.balance,
        accountTypeId: accountTypeId ?? this.accountTypeId,
      );

  static Account fromJson(json) => Account(
        id: json[AccountFields.id] as int?,
        name: json[AccountFields.name] as String?,
        balance: json[AccountFields.balance] as String?,
        accountTypeId: json[AccountFields.accountTypeId] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'balance': balance,
        'accountTypeId': accountTypeId,
      };
}
