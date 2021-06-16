import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class EnterTextField extends ChangeNotifier {
  bool _filled;
  String _name;

  EnterTextField(this._filled, this._name);

  bool get filled => _filled;
  String get name => _name;

  void setFilled() {
    _filled = true;
    notifyListeners();
  }

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
