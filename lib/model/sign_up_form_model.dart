class SignUpFormModel {
  String email;
  String password;
  String passwordConfirmation;
  String username;
  String phoneNo;

  void setEmail(String email) {
    if (!validateEmail(email)) {
      throw LoginError(message: "Invalide Email");
    }
    this.email = email;
  }

  void setPassword(String password) {
    if (password.length < 6) {
      throw LoginError(message: "Password length should more than 6 chars");
    }
    this.password = password;
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(this.email);
  }

  bool validateEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

class LoginError extends Error {
  final String message;

  LoginError({this.message});
}
