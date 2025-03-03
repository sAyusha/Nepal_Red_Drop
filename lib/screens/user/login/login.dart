import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepal_red_drop/screens/user/navigation/bottom_nav.dart';
import 'package:nepal_red_drop/screens/user/signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context)
                .size
                .height, // take full height of the screen
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(context),
                const SizedBox(height: 20),
                _inputFields(context),
                _forgotPassword(context),
                _signUp(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/logo.png'),
          height: 200,
        ),
        Text(
          'Welcome to Nepal Red Drop!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _inputFields(context) {
    return Form(
      key: _loginKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email',
                // Prefix icon for email
                prefixIcon: const Icon(
                  Icons.email,
                  size: 20,
                  color: Colors.black54,
                ),
                // Bottom border when not focused
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                // Bottom border when focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade200, width: 2),
                ),
                // default bottom border
                border: const OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: 'Password',
                // Prefix icon for password text
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 20,
                  color: Colors.black54,
                ),
                // Suffix icon for password visibility
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
                // Border when not focused
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                // Border when focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade200, width: 2),
                ),
                // default border
                border: const OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                return 'Password must be at least 8 characters';
              } else if (!RegExp(
                      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]$')
                  .hasMatch(value)) {
                return 'Password must contain at least one uppercase letter, lowercase letter, number and special character';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // if (_loginKey.currentState!.validate()) {
              //   // Navigator.pushNamed(context, '/home');
              // }
              // navigate using animation to home screen
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const BottomNavScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                transitionDuration: const Duration(milliseconds: 200),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'LOGIN',
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Colors.white, letterSpacing: 2.0),
            ),
          ),
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/forgot-password');
            },
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signUp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            // navigate using animation to login screen
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SignUpScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
              transitionDuration: const Duration(milliseconds: 200),
            ));
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
