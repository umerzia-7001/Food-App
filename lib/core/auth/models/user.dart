class User {
  String? idToken; // Firebase Auth ID token for the newly created user.
  String? email; // The email for the newly created user.
  String?
      refreshToken; //  Firebase Auth refresh token for the newly created user.
  String? expiresIn; // The number of seconds in which the ID token expires.
  String? localId; // The uid of the newly created user.

  User({
    this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idToken: json['idToken'] as String?,
      email: json['email'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiresIn: json['expiresIn'] as String?,
      localId: json['localId'] as String?,
    );
  }
}
