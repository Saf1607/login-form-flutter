class User {
  const User({
    required this.accountId,
    required this.name,
    required this.balance,
  });

  final int accountId;
  final String name;
  final int balance;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accountId: json['account_id'],
      name: json['name'],
      balance: json['balance'],
    );
  }
}
