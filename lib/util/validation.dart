class Validation {
  final String value;
  const Validation(this.value);

  String? validatePhoneNumber() {
    if (value.length != 10) {
      return "The length of the phone number must be 10";
    } else if (!_isNumeric(value)) {
      return "Please type a valid phone number";
    } else {
      return null;
    }
  }

  String? validatePasswords(String password) =>
      value == password ? null : "Password doesn't match";

  bool _isNumeric(String str) =>
      int.tryParse(str) != null && int.tryParse(str)! > 0;
}
