class User {
  const User({required this.name, required this.email});

  final String name;
  final String email;

  @override
  String toString() {
    return 'name: $name, email: $email';
  }
}
