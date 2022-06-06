part of app_constants;

class AppString {
  static const String LOGIN = 'LOGIN';
  static const String SIGN_UP = 'Sign up';
  static const String SUBMIT = 'Submit';
  static const String FORGOT_PASSWORD = 'Forgot password?';
  static const String LOGIN_WITH_GOOGLE = 'Login with Google';
  static const String WELCOME = 'Welcome Back';
  static const String DONT_HAVE_ACCOUNT = 'Don\'t have an account?';
  static const String ERROR = 'Error';
  static const String OOPS = 'Oops';
  static const String PAGE_NOT_FOUND = 'Page not found';
  static const String LOGIN_INTRODUCTION =
      'We happy to see you again. To use your account, you should log in first';
}

class AppErrorString {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String USERNAME_REQUIRED = "Username is required";
  static const String INVALID_USERNAME = "Invalid username address";
  static const String PASSWORD_REQUIRED = "Password is required";
  static const String SHORT_PASSWORD =
      "Password must be at least 6 characters";
  static const String DONT_MATCH_PASS = "Password don't match";
}
