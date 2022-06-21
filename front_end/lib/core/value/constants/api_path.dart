part of app_constants;

class ApiPath {
  ApiPath._();

  static const String ipAddress = '192.168.110.129';
  static const String port = '4000';
  static const String prefix = 'api';

  static const String baseUrl = 'https://$ipAddress/$prefix';

  static const String loginAPI = '$baseUrl/login';


}