import 'package:flutter/material.dart';

class MyDevider extends StatelessWidget {
  const MyDevider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: Color.fromARGB(255, 192, 190, 190),
      // thickness: 1,
    );
  }
}
