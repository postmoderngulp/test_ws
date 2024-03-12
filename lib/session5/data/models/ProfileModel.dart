import 'dart:convert';

import '../../domain/entities/profile.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileMoodel extends Profile {
  int id;
  String name;
  String number;
  String role;
  int balance;
  String user_id;

  ProfileMoodel({
    required this.id,
    required this.name,
    required this.number,
    required this.role,
    required this.balance,
    required this.user_id,
  }) : super(id: id, name: name, number: number, role: role, balance: balance, user_id: user_id);

  

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

  factory ProfileMoodel.fromMap(Map<String, dynamic> map) {
    return ProfileMoodel(
      id: map['id'] as int,
      name: map['name'] as String,
      number: map['number'] as String,
      role: map['role'] as String,
      balance: map['balance'] as int,
      user_id: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileMoodel.fromJson(String source) => ProfileMoodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
