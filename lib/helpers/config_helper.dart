abstract class ConfigHelper {
  static String _urlTest = 'http://192.168.137.170:8000/api';
  static String _urlProd = 'https://server.aguswmika.id/api';
  static bool _isProd = false;

  static String get url => _isProd ? _urlProd : _urlTest;
}
