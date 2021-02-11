import 'package:Waterly/ui/view/home/plant_entry/plant_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlantEditView extends StatefulWidget {
  @override
  _PlantEditViewState createState() => _PlantEditViewState();
}

class _PlantEditViewState extends State<PlantEditView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _plantNameController = TextEditingController();
  TextEditingController _intervalController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlantEditViewModel>.reactive(
      viewModelBuilder: () => PlantEditViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Add New Plant!"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _plantNameController,
                    decoration: InputDecoration(labelText: "Plant Name"),
                  ),
                  TextFormField(
                    controller: _intervalController,
                    decoration: InputDecoration(labelText: "Water Every..."),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: RaisedButton(
                      onPressed: model.isBusy
                          ? null
                          : () {
                              Map<String, dynamic> values = {
                                "name": _plantNameController.text,
                                "interval": int.parse(_intervalController.text)
                              };
                              model.createPlant(plantValues: values);
                            },
                      child: Text("Add Plant"),
                    ),
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
