class SignUpLogic {
  String userName = "";
  String userEmail = "";
  String userPassword = "";

  SignUpLogic(
      {required this.userName,
      required this.userEmail,
      required this.userPassword});

  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'email': userEmail,
      'password': userPassword,
    };
  }
}
