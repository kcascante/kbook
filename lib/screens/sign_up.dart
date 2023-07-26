import 'package:flutter/material.dart';
import 'package:kbook/components/signup_button.dart';
import 'package:kbook/screens/login_page.dart';
import '../components/my_textfield_password.dart';
import '../components/my_textfield_email.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  
void signUserUp() {}
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina'),
        backgroundColor:Colors.orange,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              MyTextFieldEmail(
                controller: emailController,                
                hintText: 'Enter Email',
                obscureText: true,
                
              ),

              const SizedBox(height: 20),

              // password textfield
              MyTextFieldPassword(
                controller: emailController,
                hintText: 'Enter Password',                
                obscureText: true,
              ),
              const SizedBox(height: 20),
               MyTextFieldPassword(                
                controller: passwordController,
                hintText: 'Enter Password',                
                obscureText: true,
              ),

              const SizedBox(height: 25),
              SignUpButton(
                onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LoginPage() ));
                  },
              ),

            ],)),)
    );
  }
}
