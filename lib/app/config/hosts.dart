import 'device.dart';

/// Urls dos hosts externos que integram a aplicação
///
/// --- ***  NÃO ALTERAR  *** --- \\\

bool isRelease = Device.currentBuildMode() == BuildMode.release;

const String localhost = 'http://192.168.2.58';

// final String urlService = isRelease ? 'https://xepa-smd.herokuapp.com' : '$localhost:5000';

const String urlService = 'https://xepa-smd.herokuapp.com';
final String urlApi = '$urlService/api';

String TOKEN = '';
