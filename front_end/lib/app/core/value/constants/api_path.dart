part of app_constants;

class ApiPath {
  static const String ipAddress = '192.168.110.129';
  static const String port = '4000';
  static const String prefix = 'api';


  static const String base1 = '$ipAddress:$port';
  static const String base2 = 'http://$ipAddress:$port';
  static const String baseUrl = 'http://$ipAddress:$port/$prefix';

  static const String loginAPI = '$baseUrl/user/login';


}