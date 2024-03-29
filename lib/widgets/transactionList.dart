import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //for date formatting
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple[300],
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Rs.${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.purple[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        DateFormat.yMMMd().format(
                            transactions[index].date), //for date formatting with intl package
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
