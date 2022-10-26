import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Mug extends Equatable {
  const Mug({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickName,
    required this.isBroken,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String? nickName;
  final bool isBroken;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        nickName,
        isBroken,
      ];
}
