abstract interface class AuthDataSource {
  Future<String> signin({
    required String email,
    required String password,
  });

  Future<String> signup({
    required String username,
    required String email,
    required String password,
  });
}
