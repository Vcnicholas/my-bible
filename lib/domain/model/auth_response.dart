
class AuthResponse {
  final bool isSuccessful;
  final String? token;
  final String? data;
  final User? user;

  AuthResponse({
    required this.isSuccessful,
    this.token,
    this.data,
    this.user,
  });

  // Factory method to create an instance from JSON
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      isSuccessful: json['success'] ?? false,
      token: json['token'],
      data: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': isSuccessful,
      'token': token,
      'message': data,
      'user': user,
    };
  }
}
class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
    );
  }}