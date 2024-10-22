import 'package:attend_easy/student/forgotpass.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:attend_easy/student/stud_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController nameController =
      TextEditingController(); // Name field
  final TextEditingController stuidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus(); // Check if the user is already logged in
  }

  @override
  void dispose() {
    nameController.dispose(); // Dispose name controller
    stuidController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    String? storedName = prefs.getString('name'); // Check stored name
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    // If email and password are stored, try logging in automatically
    if (storedEmail != null && storedPassword != null) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _auth.signInWithEmailAndPassword(
          email: storedEmail,
          password: storedPassword,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AttendEasyScreen()),
        );
      } catch (e) {
        // Handle errors, if login fails
        print("Auto-login failed: $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
      await _auth.signInWithEmailAndPassword(
        email: stuidController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save login details in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'name', nameController.text.trim()); // Store the name
      await prefs.setString('email', stuidController.text.trim());
      await prefs.setString('password', passwordController.text.trim());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AttendEasyScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    // Clear the shared preferences when logging out
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginStu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading spinner during login
          : SingleChildScrollView(
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.8,
                color: const Color.fromARGB(255, 249, 249, 249),
                margin: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: const Text(
                        'Welcome back to AttendEasy!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: const Text(
                        'Log in to manage classes and track attendance seamlessly.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: const Text(
                        'Name', // New Name Field
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: TextField(
                        controller: nameController, // Name controller
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: const Text(
                        'Student ID',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: TextField(
                        controller: stuidController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: const EdgeInsets.only(left: 45),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(left: 38),
                      child: Row(
                        children: [
                          const Text('Forgot Password?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgot(),
                                ),
                              );
                            },
                            child: const Text(
                              'Reset it',
                              style: TextStyle(color: Color(0xFF1C5B41)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(left: 45),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Inter'),
                              ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 45),
                      width: screenWidth * 0.7,
                      child: Row(
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInStu(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Color(0xFF1DC99E)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
