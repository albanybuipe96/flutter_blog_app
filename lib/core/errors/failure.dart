import 'package:flutter_blog_app/core/resources/resources.dart';

class Failure {
  const Failure({
    this.message = Strings.defaultErrorMessage,
  });

  final String message;
}
