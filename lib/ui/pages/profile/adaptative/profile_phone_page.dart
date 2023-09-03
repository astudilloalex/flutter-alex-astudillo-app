import 'package:flutter/material.dart';

class ProfilePhonePage extends StatelessWidget {
  const ProfilePhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 16.0),
        Center(
          child: CircleAvatar(
            radius: 35.0,
            foregroundImage: NetworkImage(
              'https://lh3.googleusercontent.com/a/AAcHTtc8tX3kgPCQUwgq1mHQoYWS7I6BEl026HfRBo7tMR56NNs=s432-c-no',
              scale: 0.5,
            ),
          ),
        ),
        Center(
          child: Text(
            'Alex Astudillo',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
