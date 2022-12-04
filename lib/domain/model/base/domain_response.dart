import 'package:wedding_page/domain/model/error_type.dart';

abstract class DomainResponse {}

class DomainResult<T> implements DomainResponse {
  final T data;

  DomainResult(this.data);
}

class DomainError implements DomainResponse {
  final ErrorType errorType;

  DomainError(this.errorType);
}