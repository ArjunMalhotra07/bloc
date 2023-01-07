class ValidatorMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter valid email';
    }
    return "";
  }

  String validatePasscode(String value) {
    if (value.length < 4) {
      return 'Password must be greater than 4';
    }
    return "";
  }
}
