class AppUtil {
  const AppUtil._();

  /// Check if value has match with a pattern.
  static bool hasMatch(String? value, String pattern) {
    return value != null && RegExp(pattern).hasMatch(value);
  }

  /// Verify if a [value] is email.
  static bool isEmail(String? value) {
    return hasMatch(
      value,
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
  }

  /// Validate if [value] is a valid name.
  static bool isNameValid(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    if (!value.contains(RegExp(r'^[a-zA-Z ]+$'))) return false;
    return true;
  }

  /// Validate if [value] is a safe password.
  static bool isSafePassword(String? value) {
    return hasMatch(
      value,
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
    );
  }
}
