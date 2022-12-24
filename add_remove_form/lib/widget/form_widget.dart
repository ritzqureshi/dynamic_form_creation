// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../model/contact_model.dart';

class ContactFormItemWidget extends StatefulWidget {
  final index;
  final ContactModel contactModel;
  final Function onRemove;
  ContactFormItemWidget(
      {this.index, required this.onRemove, required this.contactModel});

  @override
  State<ContactFormItemWidget> createState() => _ContactFormItemWidgetState();
}

class _ContactFormItemWidgetState extends State<ContactFormItemWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Forms - ${widget.index}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.orange),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              //Clear All forms Data
                              // widget.contactModel.name = "";
                              // widget.contactModel.number = "";
                              // widget.contactModel.email = "";
                              nameController.clear();
                              contactController.clear();
                              emailController.clear();
                            });
                          },
                          child: const Text(
                            "Clear",
                            style: TextStyle(color: Colors.blue),
                          )),
                      TextButton(
                          onPressed: () => widget.onRemove(),
                          child: const Text(
                            "Remove",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: nameController,
                // initialValue: widget.contactModel.name,
                onChanged: (value) => widget.contactModel.name = value,
                // onSaved: (value) => widget.contactModel.name = value,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: contactController,
                onChanged: (value) => widget.contactModel.number = value,
                // onSaved: (value) => widget.contactModel.name = value,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                  hintText: "Enter Number",
                  labelText: "Number",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value) => widget.contactModel.email = value,
                // onSaved: (value) => widget.contactModel.email = value,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                  labelText: "Email",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
