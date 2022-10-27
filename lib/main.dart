import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_display_view.dart';

import 'core/services/mug_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MugCubit>(
      create: (context) => MugCubit(
        mugService: MugService(
          endpoint: 'http://localhost:8080',
        ),
      )..initialize(),
      child: MaterialApp(
        title: 'Mug Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MugDisplayView(),
      ),
    );
  }
}
