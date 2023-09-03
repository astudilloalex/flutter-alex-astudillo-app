import 'package:alex_astudillo/src/user/domain/user.dart';

class ProfileState {
  const ProfileState({
    this.user = const User(
      photoUrl:
          'https://lh3.googleusercontent.com/a/AAcHTtc8tX3kgPCQUwgq1mHQoYWS7I6BEl026HfRBo7tMR56NNs=s288-c-no',
      displayName: 'Alex Astudillo',
    ),
  });

  final User user;
}
