import 'package:flutter/material.dart';

class LoginBotton extends StatelessWidget {
  const LoginBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 60,
      child: const Center(
        child: Text(
          'LogIn',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'pacifico',
          ),
        ),
      ),
    );
  }
}
