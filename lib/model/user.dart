import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson:true)
class User {

  User({
    @required this.id,
    this.name,
    this.phone,
    this.email,
    this.favorites,
  });

  final String id;

  final String name;

  final String phone;

  final String email;

  final List<int> favorites;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}