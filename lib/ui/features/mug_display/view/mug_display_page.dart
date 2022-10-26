import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';

import '../../../../core/services/mug_service.dart';
import 'mug_display_view.dart';

@immutable
class MugDisplayPage extends StatelessWidget {
  const MugDisplayPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MugDisplayCubit>(
      create: (context) => MugDisplayCubit(
        mugService: MugService(
          endpoint: 'http://localhost:8080',
        ),
      )..initialize(),
      child: const MugDisplayView(),
    );
  }
}
