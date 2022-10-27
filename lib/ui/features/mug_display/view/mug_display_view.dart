import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_state.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_create_view.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_list_item.dart';

import '../../../shared/widgets/background.dart';

@immutable
class MugDisplayView extends StatelessWidget {
  const MugDisplayView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Mug Manager',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Stack(
        children: [
          const BackgroundView(),
          BlocBuilder<MugCubit, MugDisplayState>(
            builder: ((context, state) {
              return ListView(
                children:
                    state.mugs.map((mug) => MugListItem(mug: mug)).toList(),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MugCreateView(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
