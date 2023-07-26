import 'package:flutter/material.dart';
import 'package:kbook/components/signin_button.dart';
import 'package:kbook/components/my_textfield_password.dart';
import 'package:kbook/components/my_textfield_email.dart';
import 'package:kbook/components/square_tile.dart';
import 'package:kbook/screens/home.dart';
import 'package:kbook/screens/sign_up.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPageScreen(),
    );
  }
}

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({super.key});

  void signUserIn() {}
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
   final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const SizedBox(height: 90),

              // logo
              const Row(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/img/LOGOKBOOK.png'),
                      height: 70,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

             const SizedBox(height: 20),

              // password textfield
              MyTextFieldEmail(
                controller: emailController,                
                hintText: 'Email',
                obscureText: true,
                
              ),
              
              
              

              const SizedBox(height: 20),

              // password textfield
              MyTextFieldPassword(
                controller: passwordController,                
                hintText: 'Password',
                obscureText: true,
                
              ),

              const SizedBox(height: 20),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // sign in button
              SignInButton(
                onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home() ));
                  },
              ),

              const SizedBox(height: 30),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // google + apple sign in buttons
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'assets/img/google.png'),

                  SizedBox(width: 20),

                  // apple button
                  SquareTile(imagePath: 'assets/img/apple.png')
                ],
              ),

              const SizedBox(height: 20),

              // not a member? register now
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}


