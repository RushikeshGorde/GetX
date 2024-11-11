import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'dart:developer'; // Import the debugger package

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  // Login function
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'), // Replace with your API URL
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      isLoggedIn.value = true;
      // Display success snackbar
      Get.snackbar(
        'Login Successful',
        'Welcome back!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      isLoggedIn.value = false;
      // Display error snackbar
      Get.snackbar(
        'Login Failed',
        'Invalid credentials, please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }

  // Sign up function with debugger triggered
  Future<void> signUp(String email, String password) async {
    isLoading.value = true;

    // Trigger debugger to pause and inspect variables
    debugger();  // This will pause execution in debug mode

    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'), // Replace with your API URL
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      isLoggedIn.value = true;
      // Display success snackbar
      Get.snackbar(
        'Sign-Up Successful',
        'Your account has been created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      isLoggedIn.value = false;
      // Display error snackbar
      Get.snackbar(
        'Sign-Up Failed',
        'Failed to create an account, please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }
}
