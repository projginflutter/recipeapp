import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {

  User({
    @required this.id,
    this.name,
    this.phone,
    this.email,
    this.favorites,
  });

  final int id;

  final String name;

  final String phone;

  final String email;

  final List<String> favorites;

}