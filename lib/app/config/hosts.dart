import 'device.dart';

/// Urls dos hosts externos que integram a aplicação
///
/// --- ***  NÃO ALTERAR  *** --- \\\

bool isRelease = Device.currentBuildMode() == BuildMode.release;

const String localhost = 'http://192.168.2.58';

final String urlApi = isRelease ? 'https://apis.fixpay.com.br' : '$localhost:5000';

final String TOKEN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc3VhcmlvSWQiOjExMCwiZXhwIjoxNjI5NDYwNTQzLCJpc3MiOiJBdXRoU2VydmljZSJ9.dNrewDZ0z1npDo69rxnd2IjzZCdUGPqF9OBJu3iPoU4';
