import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/test/press_button.dart';
import 'package:mobile_app/test/check_login.dart';
import 'package:mobile_app/test/enter_text_field.dart';
import 'package:mobile_app/test/set_connected.dart';
import 'package:mobile_app/test/set_register.dart';

void main() {
  test('Check if the button has been pressed', () async {
    final button = PressButton(false, "button name");
    button.pressIt();
    expect(button.pressed, true);
  });

  testWidgets('Check Login', (WidgetTester tester) async {
    await tester.pumpWidget(Login(title: 'Login', loggedIn: true));

    final titleFinder = find.text('Login');

    expect(titleFinder, findsOneWidget);
  });

  test('Check text inputs', () async {
    final button = EnterTextField(false, "Enter Field");
    button.setFilled();
    expect(button.filled, true);
  });

  testWidgets('Set connected boolean', (WidgetTester tester) async {
    await tester
        .pumpWidget(SetConnected(title: 'Set Connected', connected: true));

    final titleFinder = find.text('Set Connected');

    expect(titleFinder, findsOneWidget);
  });

  test('Check Registered', () async {
    final registW = CheckRegister(false, "Set Registered Test");
    registW.setRegistered();
    expect(registW.isRegist, true);
  });
}
