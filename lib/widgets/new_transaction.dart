import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        //wrapping to put padding
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, //to put the button to right
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (input) {
              //   titleInput = input;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (input) {
              //   amountInput = input;
              // },
            ),
            TextButton(
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
                // print(amountInput);
                // print(titleInput);
              },
              child: Text('Save'),
              style: TextButton.styleFrom(
                //for text color in TextButton
                primary: Colors.pink[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
