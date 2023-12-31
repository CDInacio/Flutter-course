import 'package:flutter/material.dart';
import 'package:user_input_and_forms/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 50) {
                  return 'Must be between 1 and 50 characters';
                }
                return null; // if return is null, validation succeeded
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // textFormField is unconstrained horizontally, like Row. So we have to wrap it with the Expanded Widget
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text('Quantity')),
                    initialValue: '1',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          //tryParse returs null if it cant convert string to a number
                          int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0) {
                        return 'Must be a valid positive number';
                      }
                      return null; // if return is null, validation succeeded
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                      items: categories.entries
                          .map((category) => DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(category.value.title)
                                ],
                              )))
                          .toList(),
                      onChanged: (value) {
                        print(('object'));
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('Reset')),
                ElevatedButton(onPressed: () {}, child: const Text('Add item'))
              ],
            )
          ],
        )),
      ),
    );
  }
}
