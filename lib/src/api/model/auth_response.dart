class AuthResponse {
  final String id;
  final String name;
  final String email;
  final String image;
  final List<String> providers;
  final bool newUser;

  AuthResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        image = json['image'],
        providers = json['providers'].cast<String>(),
        newUser = json['newUser'];
}
