class User {
  const User({
    required this.id,
    required this.email,
    required this.username,
  });

  factory User.empty() => const User(id: '', email: '', username: '');

  final String? id;
  final String? email;
  final String? username;
}
