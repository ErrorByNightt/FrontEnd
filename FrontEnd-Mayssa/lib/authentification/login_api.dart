import 'package:google_sign_in/google_sign_in.dart';

class LoginAPi {
  static final _googlesignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googlesignIn.signIn();
  static Future signout = _googlesignIn.signOut();
}