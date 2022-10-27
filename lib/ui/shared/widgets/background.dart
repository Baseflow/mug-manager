import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/background.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(.7)),
      ),
    );
  }
}
