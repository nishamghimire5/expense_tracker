import 'package:flutter/material.dart';
import 'transactionList.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _madeTransactions = [
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

void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        );
        setState(() {
    _madeTransactions.add(newTx);
    });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_madeTransactions),
      ],
    );
  }
}
