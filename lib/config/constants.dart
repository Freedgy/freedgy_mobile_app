import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF2196F3);
const PrimaryLightColor = Color(0xFFFFECDF);
const SecondaryColor = Color(0xFF979797);
const TertiaryColor = Color(0xFFFFA53E);
const TextColor = Color(0xFF757575);

const AnimationDuration = Duration(milliseconds: 200);

final RegExp emailRegEx = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

enum MenuState { home, settings, profile }
