class HttpException implements Exception {
  const HttpException({
    this.code = 0,
    this.message = '',
  });

  final int code;
  final String message;
}
