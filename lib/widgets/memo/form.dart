import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ppm/components/alert_model.dart';
import 'package:ppm/components/confirmation_model.dart';
import 'package:ppm/components/memo_input.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/common/button.dart';
import 'package:intl/intl.dart';

class MemoForm extends StatefulWidget {
  const MemoForm({Key? key}) : super(key: key);

  @override
  State<MemoForm> createState() => _MemoFormState();
}

class _MemoFormState extends State<MemoForm> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  final _titleValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);
  final _descValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);
  final _fromValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);
  final _nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);
  final _addressValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);
  final _rnshipValidator = MultiValidator([
    RequiredValidator(errorText: 'Info is required'),
    MinLengthValidator(3, errorText: 'Content: minimum 5 characters long'),
  ]);

  final _formKey = GlobalKey<FormState>();
  var _titleController = TextEditingController();
  String dropdownValue = "Property type";
  var _descController = TextEditingController();
  var _fromController = TextEditingController();
  var _nameController = TextEditingController();
  var _addressController = TextEditingController();
  var _rnshipController = TextEditingController();

  List list = <String>[
    'Property type',
    'Heirloom',
    'Collectibles',
    'Furniture',
    'Jewelry',
    'Miscellaneous',
  ];
  @override
  Widget build(BuildContext context) {
    final String formatted = formatter.format(now);
    void createMemo() {
      FirebaseFirestore.instance.collection("memos").add({
        "title": _titleController.text,
        "type": dropdownValue,
        "description": _descController.text,
        "obtainedFrom": _fromController.text,
        "recipientName": _nameController.text,
        "recipientAddress": _addressController.text,
        "relationship": _rnshipController.text,
        "timeStamp": formatted
      }).then((res) {
        FirebaseFirestore.instance.collection("notifications").add({
          "info": 'Memo created successfully!',
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                  child: ConfirmationModel(
                      title: 'Success!',
                      data:
                          'Your memo is created. Please navigate to your account to see it.',
                      height: 250,
                      width: 300,
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      button: 'Got it!'));
            });
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertModel(
                  padding: EdgeInsets.all(20),
                  data: 'Error! Something went wrong!',
                  height: 200,
                  width: 400,
                ),
              );
            });
      });
    }

    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              MemoInputModel(
                obscure: false,
                label: 'Memo Title',
                suffixIcon: Visibility(visible: false, child: Container()),
                validator: _titleValidator,
                controller: _titleController,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[500]!),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isDense: true,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: dropdownValue,
                  alignment: AlignmentDirectional.centerStart,
                  elevation: 1,
                  underline: Container(color: Colors.transparent),
                  style: theme.textTheme.subtitle2,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              MemoInputModel(
                  obscure: false,
                  label: 'Memo Description',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: _descValidator,
                  controller: _descController),
              SizedBox(height: 20),
              MemoInputModel(
                  obscure: false,
                  label: 'Obtained from ?',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: _fromValidator,
                  controller: _fromController),
              SizedBox(height: 20),
              MemoInputModel(
                  obscure: false,
                  label: 'Gift Recipient name',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: _nameValidator,
                  controller: _nameController),
              SizedBox(height: 20),
              MemoInputModel(
                  obscure: false,
                  label: 'Recipient\'s address',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: _addressValidator,
                  controller: _addressController),
              SizedBox(height: 20),
              MemoInputModel(
                  obscure: false,
                  label: 'Relationship',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: _rnshipValidator,
                  controller: _rnshipController),
              SizedBox(height: 20),
              Button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('validated');
                      createMemo();
                      setState(() {
                        _titleController.text = '';
                        _descController.text = '';
                        _fromController.text = '';
                        _nameController.text = '';
                        _addressController.text = '';
                        _rnshipController.text = '';
                      });
                    } else {
                      print('Error, Something went wrong!');
                    }
                  },
                  text: 'Create Memo',
                  style: theme.textButtonTheme.style!),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
