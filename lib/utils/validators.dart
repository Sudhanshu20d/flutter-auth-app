class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Email required";

    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

    if (!emailRegex.hasMatch(value)) return "Invalid email";

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Password required";
    if (value.length < 6) return "Minimum 6 characters";
    return null;
  }
}