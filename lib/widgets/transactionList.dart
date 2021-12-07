import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //for date formatting
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      DateFormat.yMMMd().format(
                          tx.date), //for date formatting with intl package
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
