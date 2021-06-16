import 'package:flutter/foundation.dart' show ChangeNotifier;

class PressButton extends ChangeNotifier {
  bool _pressed;
  String _name;

  PressButton(this._pressed, this._name);

  bool get pressed => _pressed;
  String get name => _name;

  void pressIt() {
    _pressed = true;
    notifyListeners();
  }

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
