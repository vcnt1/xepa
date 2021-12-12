import 'package:xepa/app/config/enums.dart';

import 'error.dart';

class Fetchable{
  const Fetchable({this.status = FetchStatus.initial, this.error});

  final FetchStatus status;
  final MyError? error;

  bool get isIddle => status == FetchStatus.initial;

  bool get isLoading => status == FetchStatus.loading;

  bool get isLoaded => status == FetchStatus.success;

  bool get isNotLoaded => status != FetchStatus.success;

  bool get isError => status == FetchStatus.error;
}