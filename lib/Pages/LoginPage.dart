import 'package:flutter/material.dart';
import 'package:myapp/widgets/thems.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, '/home');
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/login.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            "Welcome $name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "Enter your Name",
                            ),
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name cannot be empty";
                              }
                              return null;
                            }),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your Email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => moveToHome(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Mytheme.darkbluisColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: changeButton
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
