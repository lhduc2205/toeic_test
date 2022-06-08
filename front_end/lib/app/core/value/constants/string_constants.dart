part of app_constants;

class AppString {
  static const String login = 'LOGIN';
  static const String signUp = 'Sign up';
  static const String registration = 'Registration';
  static const String submit = 'Submit';
  static const String forgotPassword = 'Forgot password?';
  static const String loginWithGoogle = 'Login with Google';
  static const String welcome = 'Welcome Back';
  static const String dontHaveAccount = 'Don\'t have an account?';
  static const String error = 'Error';
  static const String oops = 'Oops';
  static const String pageNotFound = 'Page not found';
  static const String loginIntroduction =
      'We happy to see you again. To use your account, you should log in first';
}

class AppErrorString {
  static final RegExp emailValidatorRegExp =
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  static const String usernameRequired = 'Username is required';
  static const String invalidUsername = 'Invalid username address';
  static const String passwordRequired = 'Password is required';
  static const String shortPassword =
      'Password must be at least 6 characters';
  static const String dontMatchPassword = "Password don't match";
}
