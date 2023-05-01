import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String? _userId;

  String get userId => _userId ?? '';
  set userId(String value) {
    _userId = value;
    notifyListeners();
  }
}
