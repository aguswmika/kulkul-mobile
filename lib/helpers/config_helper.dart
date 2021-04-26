abstract class ConfigHelper {
  // static String url = 'https://agus.balidigitalheritage.com/';
  static String _urlTest = 'http://192.168.100.100:8000';
  static String _urlProd = 'http://192.168.0.195:8000';
  static bool _isProd = false;

  static String get url => _isProd ? _urlProd : _urlTest;
  
}
