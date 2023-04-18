mixin validation {
  String? validatorPassword(value) {
    if (value == null || value.length < 6) {
      return 'Please enter at least 6 digits.';
    }
    return null;
  }

  String? validatorEmail(value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter valid email.';
    }
    return null;
  }
}
