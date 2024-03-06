import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  int id;
  String name;
  String number;
  String role;
  int balance;
  String user_id;
  Profile({
    required this.id,
    required this.name,
    required this.number,
    required this.role,
    required this.balance,
    required this.user_id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'number': number,
      'role': role,
      'balance': balance,
      'user_id': user_id,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as int,
      name: map['name'] as String,
      number: map['number'] as String,
      role: map['role'] as String,
      balance: map['balance'] as int,
      user_id: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
