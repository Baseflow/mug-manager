import 'package:flutter/material.dart';

import '../../../../core/models/mug.dart';

class MugListItem extends StatelessWidget {
  const MugListItem({
    super.key,
    required this.mug,
  });

  final Mug mug;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          '${mug.firstName} ${mug.nickName != null ? '\'${mug.nickName}\'' : ''} ${mug.lastName} ${mug.isBroken ? '💀' : ''}'),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
    );
  }
}
