import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/dialogs/progress_dialog.dart';
import 'package:tyfon/app/views/pages/splash_screen/splash_controller.dart';
import 'package:meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/screen_utils.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onAfterFirstLayout: (_, __) {
        if (!context.isTablet) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        }
      },
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
