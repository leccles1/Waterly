import 'package:Waterly/ui/view/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Container(),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48.0, right: 48.0, bottom: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48.0, right: 48.0, bottom: 30.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter password.";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "Password"),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                    child: Text("Login"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.loginWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                      }
                    }),
                RaisedButton(
                  child: Text("Create Account"),
                  onPressed: () => model.beginRegistration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
