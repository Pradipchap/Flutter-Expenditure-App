import 'package:flutter/material.dart';
import './input.dart';

class Input extends StatefulWidget {
  final Function click;
  Input({required this.click, super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    String tt = titleController.text;
    double aa = double.parse(amountController.text);
    if (tt.isEmpty || aa <= 0) return;

    widget.click(tt, aa);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'title'),
            keyboardType: TextInputType.text,
            keyboardAppearance: Brightness.light,
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submit(),
          ),
          TextButton(
              onPressed: submit,
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 22),
              )),
        ],
      ),
    );
  }
}
