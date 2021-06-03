abstract class ConfigHelper {
  static String _urlTest = 'http://192.168.1.18:8000/api';
  static String _urlProd = 'https://server.aguswmika.id/api';
  static bool _isProd = true;

  static String get url => _isProd ? _urlProd : _urlTest;
}
