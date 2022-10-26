import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/core/models/mug.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_state.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_list_item.dart';

@immutable
class MugDisplayView extends StatelessWidget {
  const MugDisplayView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Mug manager',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          BlocBuilder<MugDisplayCubit, MugDisplayState>(
            builder: ((context, state) {
              return Expanded(
                child: ListView(
                  children:
                      state.mugs.map((mug) => MugListItem(mug: mug)).toList(),
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<MugDisplayCubit>().createMug(
              mug: const Mug(
                id: 1,
                firstName: 'Jeroen',
                lastName: 'Koster',
                nickName: '',
                isBroken: false,
              ),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
