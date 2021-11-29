import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:tyfon/app/views/home/home_page.dart';
import 'package:tyfon/app/views/login/login_page.dart';
import 'package:tyfon/app/views/nav_bottom/bottomnavigationbar.dart';
import 'package:tyfon/app/views/orders/pay.dart';
import 'package:tyfon/app/views/pages/splash_screen/splash_page.dart';
import 'package:tyfon/app/views/register/register_page_email.dart';
import 'package:tyfon/app/views/register/register_page_name.dart';
import 'package:tyfon/app/views/register/register_page_password.dart';
import 'package:tyfon/app/views/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.HOME: (_) => const HomePage(),
      Routes.REGISTER: (_) => const RegisterPageEmail(),
      Routes.REGISTERNAME: (_) => const RegisterPageName(),
      Routes.REGISTERPASSWORD: (_) => const RegisterPagePassword(),
      Routes.LAYERNAV: (_) => const MyStatefulWidget()
    };
