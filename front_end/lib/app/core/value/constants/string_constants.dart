part of app_constants;

class AppString {
  static const String LOGIN = 'LOGIN';
  static const String WELCOME = 'Welcome Back';
  static const String LOGIN_INTRODUCTION =
      'We happy to see you again. To use your account, you should log in first';
}

class AppErrorString {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String EMAIL_REQUIRED = "Email is required";
  static const String INVALID_EMAIL = "Invalid email address";
  static const String PASSWORD_REQUIRED = "Password is required";
  static const String SHORT_PASSWORD =
      "Password must be at least 6 characters";
  static const String DONT_MATCH_PASS = "Password don't match";
}
