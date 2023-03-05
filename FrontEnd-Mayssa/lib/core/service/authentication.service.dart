import 'package:project_coding_game/app/credentials/supabase.credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  Future<void> signup({
    required String email,
    required String password,
  }) async {
    var response = await SupasbaseCredentials.supabaseClient.auth
        .signUp(email: email, password: password);
    if (response.user == null) {}
  }
}
