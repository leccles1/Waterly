import 'package:Waterly/ui/view/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  // TODO: Create splash screen
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.handleStartupLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30.0,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
