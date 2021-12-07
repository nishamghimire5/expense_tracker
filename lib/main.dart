import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart'; //for date formatting

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 2999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Keyboard',
      amount: 4999.99,
      date: DateTime.now(),
    ),
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.green,
              child: Text('Chart!'),
            ),
          ),
          Card(
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
                      print(titleController.text);
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
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple[300],
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Rs.${tx.amount}',
                        style: TextStyle(
                            color: Colors.purple[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            DateFormat.yMMMd().format(tx
                                .date), //for date formatting with intl package
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
