import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/text_style_gradient.dart';

// ignore: use_key_in_widget_constructors
class CardProfileData extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AnimationController _animationController;
    return Container(
      alignment: Alignment.center,
      decoration: _boxDecoration(),
      child: Column(children: <Widget>[
        const SizedBox(height: 20),
        _imageData(context, watch),
        const SizedBox(height: 15),
        _headlineName(),
        _subheadlineEmail(),
        const SizedBox(height: 10),
        _buttonEdit(),
        const SizedBox(height: 10),
      ]),
    );
  }
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(borderRadius: BorderRadius.circular(10));
}

Widget _imageData(BuildContext context, ScopedReader watch) {
  final sessionController = watch(sessionProvider);
  final userCurrent = sessionController.user!;
  final displayName =
      userCurrent.displayName ?? FirebaseAuth.instance.currentUser?.displayName;
  final firstletter = displayName!.isNotEmpty ? displayName[0] : "";

  return Container(
    height: 130,
    width: 130,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.00), color: Colors.blueAccent),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstletter,
          style: const TextStyle(
              fontFamily: 'Silka Bold', fontSize: 80, color: Colors.white),
        )
      ],
    ),
  );
}

Widget _headlineName() {
  return Column(
    children: [
      Consumer(builder: (_, watch, __) {
        final user = watch(sessionProvider).user!;
        return TextStyleGradient(
            textChanged: user.displayName ??
                FirebaseAuth.instance.currentUser!.displayName ??
                '');
      }),
    ],
  );
}

Widget _subheadlineEmail() {
  return Column(
    children: [
      Consumer(builder: (_, watch, __) {
        final user = watch(sessionProvider).user!;
        return Text(
          user.email ?? '',
          style: const TextStyle(
            fontFamily: 'Silka Medium',
            fontSize: 10,
            color: Colors.white,
          ),
        );
      }),
    ],
  );
}

Widget _buttonEdit() {
  return OutlinedButton(
    child: const Text('Editar',
        style: TextStyle(
          fontFamily: 'Silka Medium',
          fontSize: 12,
          color: Colors.white,
        )),
    style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        side: const BorderSide(color: Colors.blueAccent, width: 1)),
    onPressed: null,
  );
}
