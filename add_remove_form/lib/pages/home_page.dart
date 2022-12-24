import 'package:add_remove_form/widget/form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List contactForms = [];
  // bool isValidated() => state.validate();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title:const Text("Create Multi Contacts"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            onSave();
          },
          child:const Text("Save"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child:const Icon(Icons.add),
        onPressed: () {
          onAdd();
        },
      ),
      body: contactForms.isNotEmpty
          ? ListView.builder(
              itemCount: contactForms.length,
              itemBuilder: (_, index) {
                return contactForms[index];
              })
          : const Center(child: Text("Tap on + to Add Contact")),
    );
  }

  //Validate all forms and submit
  onSave() {
    bool allValid = true;

    //If any form validation function returns false means all forms are not valid
    // contactForms
    //     .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      for (int i = 0; i < contactForms.length; i++) {
        ContactFormItemWidget item = contactForms[i];
        debugPrint("Name: ${item.contactModel.name}");
        debugPrint("Number: ${item.contactModel.number}");
        debugPrint("Email: ${item.contactModel.email}");
      }
      //Submit Form Here
    } 
  }
  //Add
  onAdd() {
  setState(() {
    ContactModel contactModel = ContactModel(contactForms.length,"","","");
    contactForms.add(ContactFormItemWidget(
      index: contactForms.length,
      contactModel: contactModel,
      onRemove: () => onRemove(contactModel),
    ));
  });
}
//Delete/Remove specific form 
onRemove(ContactModel contact) {
  setState(() {
    int index = contactForms
        .indexWhere((element) => element.contactModel.id == contact.id);

     contactForms.removeAt(index);
  });
}
}
