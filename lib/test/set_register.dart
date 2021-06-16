import 'package:flutter/foundation.dart' show ChangeNotifier;

class CheckRegister extends ChangeNotifier {
  bool _registered;
  String _name;

  CheckRegister(this._registered, this._name);

  bool get isRegist => _registered;
  String get name => _name;

  void setRegistered() {
    _registered = true;
    notifyListeners();
  }

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
