import 'package:news_demo/pages/application/application_page.dart';
import 'package:news_demo/pages/sign/sign_in.dart';
import 'package:news_demo/pages/sign/sign_up.dart';

var staticRoutes = {
  "/signIn": (context) => SignInPage(),
  "/signUp": (context) => SignUpPage(),
  "/app": (context) => ApplicationPage(),
};
