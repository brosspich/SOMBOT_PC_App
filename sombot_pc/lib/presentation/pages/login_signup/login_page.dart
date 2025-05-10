// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sombot_pc/presentation/widgets/txt_form_field/txt_field_input.dart';
import 'package:sombot_pc/presentation/widgets/txt_form_field/txt_field_pass.dart';

import '../../../core/config/l10n/generated/app_localizations.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text,
      );

      context.router.replaceNamed('/root');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  // TextFormField(
                  //   controller: _email,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Email',
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   keyboardType: TextInputType.emailAddress,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty)
                  //       return 'Email required';
                  //     if (!value.contains('@')) return 'Invalid email';
                  //     return null;
                  //   },
                  // ),

                  TxtFieldInput(
                    txtController: _email,
                    hintText: "Email",
                    iCons: Icons.email,
                    txtFocusNode: _emailFocusNode,
                    txtInputTypekeyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      if (!value.contains('@')) return 'Invalid email';
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // TextFormField(
                  //   controller: _password,
                  //   obscureText: !_isPasswordVisible,
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //     border: const OutlineInputBorder(),
                  //     suffixIcon: IconButton(
                  //       icon: Icon(_isPasswordVisible
                  //           ? Icons.visibility
                  //           : Icons.visibility_off),
                  //       onPressed: () {
                  //         setState(
                  //             () => _isPasswordVisible = !_isPasswordVisible);
                  //       },
                  //     ),
                  //   ),
                  //   validator: (value) => (value == null || value.length < 6)
                  //       ? 'Min 6 characters'
                  //       : null,
                  // ),

                  TxtFieldPass(
                    txtController: _password,
                    hintText: "Password",
                    iCons: Icons.password,
                    txtFocusNode: _passwordFocusNode,
                    txtInputTypekeyboard: TextInputType.text,
                    validator: (value) => (value == null || value.length < 6)
                        ? 'Min 6 characters'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _login();
                          context.router.replaceNamed('/root');
                        });
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : Text(language.login),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      context.router.pushNamed('/signup');
                    },
                    child: const Text("Don't have an account? Register"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
