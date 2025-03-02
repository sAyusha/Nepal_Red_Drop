import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nepal_red_drop/screens/user/login/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(24.0),
          // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(context),
              const SizedBox(height: 20),
              _inputFields(context),
              _logIn(context),
            ],
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
        Text(
          'Create your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  _inputFields(context) {
    return Form(
      key: _signUpKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: fullNameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                labelText: 'Full Name',
                // Prefix icon for email
                prefixIcon: const Icon(
                  Icons.person,
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
                return 'Please enter your full name';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
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
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              // Prefix icon for phone number
              prefixIcon: const Icon(
                Icons.phone,
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
              border: const OutlineInputBorder(),
            ),
            initialCountryCode: 'NP',
            onChanged: (phone) {
              print(phone.completeNumber);
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
          TextFormField(
            controller: confirmPasswordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: 'Confirm Password',
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
              // Navigator.pushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder()),
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Colors.white, letterSpacing: 2.0),
            ),
          ),
          const SizedBox(height: 5),
          const Center(child: Text("OR")),
          const SizedBox(height: 5),
/* ................................................................................. */
          // other signup methods with google and facebook
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.red,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.white.withOpacity(0.5),
              //     spreadRadius: 1,
              //     blurRadius: 1,
              //     offset: const Offset(0, 1), // changes position of shadow
              //   ),
              // ],
            ),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/google.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 18),
                  const Text(
                    "Sign In with Google",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _logIn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            // navigate using fade through animation to login screen.
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 200)));
          },
          child: Text(
            'Login',
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
