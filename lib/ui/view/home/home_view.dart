import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:Waterly/ui/view/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) async => model.findPlants(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          leading: Container(),
        ),
        body: model.isBusy
            ? Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Text("No Plants to Display")
                ],
              ))
            : ListView.builder(
                itemCount: model.plantEntries.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () => model.deletePlantEntry(index),
                  child: Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: Center(
                        child: Text('${model.plantEntries[index].name}')),
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => model.createPlant(), child: Icon(Icons.add)),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
