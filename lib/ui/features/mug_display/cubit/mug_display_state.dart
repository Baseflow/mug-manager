import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/mug.dart';

@immutable
class MugDisplayState extends Equatable {
  const MugDisplayState({
    required this.mugs,
  });

  final List<Mug> mugs;

  @override
  List<Object?> get props => [mugs];
}
