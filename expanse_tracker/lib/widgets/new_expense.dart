import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // we have to delete the controller when this widget is not needed anymore.
  // "dispose" is called automatically by Flutter when the widget and it´s state
  // are about to be destroyed(removed from the UI)
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(label: Text('Title')),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration:
              const InputDecoration(prefixText: '\$', label: Text('Amount')),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  print(_titleController);
                },
                child: const Text('Save Expense'))
          ],
        ),
      ]),
    );
  }
}
