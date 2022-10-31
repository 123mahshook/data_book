class TextFieldValidation {
  static bool phoneValidate(String value) {
    final RegExp regExp = RegExp(r'^[6-9]\d{9}$');
    return regExp.hasMatch(value);
  }

  static bool nameValidate(String value) {
    final RegExp regExp = RegExp(r'^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$');
    return regExp.hasMatch(value);
  }

  static bool passwordValidate(String value) {
    return value.isEmpty ? false : true;
  }

  static bool confirmPasswordValidate(String value, String password) {
    return value.isEmpty
        ? false
        : value == password
            ? true
            : false;
  }

  static bool emptyValidate(String value) {
    return value.isEmpty ? false : true;
  }

  static bool defaultValidate(String value) {
    final RegExp regExp = RegExp(r'^[A-Za-z0-9](?!.*?\s$)[A-Za-z0-9\s]{0,9}$');
    return regExp.hasMatch(value);
  }

  static bool emailValidate(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  static bool vehRegNoValidate(String value) {
    final RegExp regExp = RegExp(
        r'(^[a-zA-Z]{2}[ -]?\d{1,2}[ -]?[a-zA-Z]{0,2}[- ]?[a-zA-Z]{0,2}\d{1,4}$)|(^[a-zA-Z]{3}[ -]?\d{1,4}$)|(^DL[ -]?\d{1,2}[ -]?[a-zA-Z]{1}[ -]?[a-zA-Z]{1,2}[ -]\d{1,4})');
    return regExp.hasMatch(value);
  }

  static bool kmdrivenValidate(String value) {
    final RegExp regExp = RegExp(r'^[1-9]\d*$');
    return regExp.hasMatch(value);
  }
}
