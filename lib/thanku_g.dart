import 'package:flutter/material.dart';

class ThankuGPage extends StatefulWidget {
  @override
  _ThankuGPageState createState() => _ThankuGPageState();
}

class _ThankuGPageState extends State<ThankuGPage> {
  final _formKey = GlobalKey<FormState>();
  final _giftCodeController = TextEditingController();
  final List<String> _validGiftCodes = ['123', '456', '789']; // Pre-stored gift codes
  final Map<String, int> _giftCodeCounts = {'123': 0, '456': 0, '789': 0}; // Count of each gift code
  String _resultMessage = ''; // To store the result message

  @override
  void dispose() {
    _giftCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String enteredCode = _giftCodeController.text;
      if (_validGiftCodes.contains(enteredCode)) {
        setState(() {
          _giftCodeCounts[enteredCode] = _giftCodeCounts[enteredCode]! + 1;
          int totalDisbursed = _giftCodeCounts.values.reduce((a, b) => a + b);
          double percentage = (_giftCodeCounts[enteredCode]! / totalDisbursed) * 100;
          _resultMessage = 'Gift Code is valid: $enteredCode\nCount: ${_giftCodeCounts[enteredCode]}\nPercentage: ${percentage.toStringAsFixed(2)}%';
        });
      } else {
        setState(() {
          _resultMessage = 'Invalid Gift Code: $enteredCode';
        });
      }
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
              SizedBox(height: 20),
              Text(
                _resultMessage,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}