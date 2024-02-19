import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sokosellers/controller/auth_controller.dart';

class SokoLoginScreen extends StatelessWidget {
  // final LoginController loginController = Get.put(LoginController());
  String emailC = Get.find<AuthController>().email.value;
  String passwordC = Get.find<AuthController>().password.value;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: Get.find<AuthController>().setEmail,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: Get.find<AuthController>().setPassword,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: Get.find<AuthController>().sokoLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
