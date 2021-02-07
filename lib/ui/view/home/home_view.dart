import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:Waterly/ui/view/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({@required this.user});

  Response user;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome, ' + user.data['name'] + "!"),
          leading: Container(),
        ),
        body: Center(
          child: Text("No plants to display!"),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
