import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height, // take full height of the screen
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
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: 'Email',
              // Bottom border when not focused
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              // Bottom border when focused
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2),
              ),
              // default bottom border
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              // Border when not focused
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              // Border when focused
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2),
              ),
              // default border
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/home');
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
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, letterSpacing: 2.0),
          ),
        ),
      ],
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
            // Navigator.pushNamed(context, '/register');
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
