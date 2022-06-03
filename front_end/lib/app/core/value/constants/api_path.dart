part of app_constants;

class ApiPath {
  static const String IP_ADDRESS = "192.168.110.129";
  static const String PORT = "4000";
  static const String PREFIX = "api";


  static const String base1 = "$IP_ADDRESS:$PORT";
  static const String base2 = "http://$IP_ADDRESS:$PORT";
  static const String baseUrl = "http://$IP_ADDRESS:$PORT/$PREFIX";

  static const String loginAPI = "$baseUrl/user/login";


}