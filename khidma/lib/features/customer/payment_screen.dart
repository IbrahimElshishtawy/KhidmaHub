// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String method = 'visa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدفع')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'TOTAL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            const Text(
              '150',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            RadioListTile<String>(
              value: 'visa',
              groupValue: method,
              onChanged: (val) => setState(() => method = val!),
              title: const Text('VISA **** 2334'),
            ),
            RadioListTile<String>(
              value: 'mastercard',
              groupValue: method,
              onChanged: (val) => setState(() => method = val!),
              title: const Text('MasterCard **** 3774'),
            ),
            RadioListTile<String>(
              value: 'paypal',
              groupValue: method,
              onChanged: (val) => setState(() => method = val!),
              title: const Text('PayPal'),
              subtitle: const Text('abc@gmail.com'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Pay now'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('Add new card')),
          ],
        ),
      ),
    );
  }
}
