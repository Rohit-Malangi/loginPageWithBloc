import 'dart:async';

import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

class Bloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  set changeEmail(String value) {
    _email.sink.add(value);
  }

  set changePassword(String value) {
    _password.sink.add(value);
  }

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError('Please enter a valid email');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 3) {
        sink.add(data);
      } else {
        sink.addError('Please enter at least 4 numbers');
      }
    },
  );

  submitData() {
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}
