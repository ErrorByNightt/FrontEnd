import 'package:supabase_flutter/supabase_flutter.dart';

class SupasbaseCredentials {
  // ignore: constant_identifier_names
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqeXlhZmZiY3djbGlqb3h2ZXd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc4NzU4NTEsImV4cCI6MTk5MzQ1MTg1MX0.METkePWhrDmUX55S5m8TtA0gyANDYJj49uO5Btiv3rw";
  // ignore: constant_identifier_names
  static const String APIURL = "https://vjyyaffbcwclijoxvewv.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
