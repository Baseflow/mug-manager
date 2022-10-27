import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_edit_view.dart';

import '../../../../core/models/mug.dart';
import '../cubit/mug_display_cubit.dart';

class MugListItem extends StatelessWidget {
  const MugListItem({
    super.key,
    required this.mug,
  });

  final Mug mug;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MugEditView(mug: mug),
        ),
      ),
      title: Text(
          '${mug.firstName} ${mug.nickName != null ? '\'${mug.nickName}\'' : ''} ${mug.lastName} ${mug.isBroken ? '💀' : ''}'),
      trailing: IconButton(
          onPressed: () => context.read<MugCubit>().deleteMug(mugId: mug.id),
          icon: const Icon(Icons.delete)),
    );
  }
}
