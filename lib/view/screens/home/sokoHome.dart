import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SokoHome extends StatelessWidget {
  const SokoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child:Text("${getStringAsync("access_token_code")}") ,)));
  }
}