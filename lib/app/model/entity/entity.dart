import 'package:xepa/app/model/error.dart';

class Entity<T> {
  Entity({this.error, this.object});

  T? object;
  MyError? error;
}
