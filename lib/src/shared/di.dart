import 'package:flutter_blog_app/env/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Di {
  const Di._();

  static Future<void> init() async {
    await _initSupabase();
  }

  static Future<void> _initSupabase() async {
    await Supabase.initialize(
      url: Secrets.SUPABASE_URL,
      anonKey: Secrets.SUPABASE_ANON_KEY,
    );
  }
}
