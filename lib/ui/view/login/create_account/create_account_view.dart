import 'package:Waterly/ui/view/login/create_account/create_account_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Create Account here.")],
        ),
      ),
    );
  }
}
