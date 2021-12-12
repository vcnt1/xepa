enum ErrorType {
  apiError,
  invalidFormat,
  noInternetConnection,
  noServiceAvailable,
  unknown,
}

extension ErrorTypeExtension on ErrorType {
  String get message {
    switch (this) {
      case ErrorType.apiError:
        return 'An API error occured';
      case ErrorType.invalidFormat:
        return 'Invalid format was found';
      case ErrorType.noInternetConnection:
        return 'No internet connection';
      case ErrorType.noServiceAvailable:
        return 'No service available';
      case ErrorType.unknown:
        return 'An unknown error occured';
    }
  }
}

enum InputType {
  dataInicial,
  dataFinal,
}

enum FetchStatus {
  iddle,
  initial,
  error,
  loading,
  success,
}

enum SessionStatus {
  authenticated,
  initial,
  unauthenticated,
  unknown,
}
