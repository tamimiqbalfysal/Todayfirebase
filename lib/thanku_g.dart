import 'package:flutter/material.dart';

class ThankuGPage extends StatefulWidget {
  @override
  _ThankuGPageState createState() => _ThankuGPageState();
}

class _ThankuGPageState extends State<ThankuGPage> {
  final _formKey = GlobalKey<FormState>();
  final _giftCodeController = TextEditingController();

  @override
  void dispose() {
    _giftCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the gift code
      print('Gift Code: ${_giftCodeController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gift Code submitted: ${_giftCodeController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanku G'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _giftCodeController,
                decoration: InputDecoration(
                  labelText: 'Gift Code',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a gift code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}