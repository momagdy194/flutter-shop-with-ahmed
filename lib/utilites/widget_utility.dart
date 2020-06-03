import 'package:flutter/material.dart';

Widget erore(String text) {
  return Container(child: Center(child: Text(text)));
}

Widget loading() {
  return Container(child: Center(child:CircularProgressIndicator(backgroundColor: Colors.white,)));
}
