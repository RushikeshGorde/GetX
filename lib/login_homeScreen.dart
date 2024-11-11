import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/logincontroller.dart';
// import 'login_controller.dart';

class AuthPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login / Sign-Up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Password TextField
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Login Button
            Obx(() {
              return loginController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        loginController.login(
                            emailController.text, passwordController.text);
                      },
                      child: Text('Login'),
                    );
            }),
            SizedBox(height: 20),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                loginController.signUp(
                    emailController.text, passwordController.text);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
