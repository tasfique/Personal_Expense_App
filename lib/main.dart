import 'package:flutter/material.dart';
import 'package:personal_expense_app/transaction.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
        id: 't1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.69, date: DateTime.now())
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
        //can set the position with mainaxis
        //because it is default
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                width: 100,
                child: Text('CHART'),
              ),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // }
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    //onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleController);
                      print(amountController);
                    },
                  )
                ],
              ),
            ),
          ),
          Column(
            //this is dynamic.
            children: transactions.map((tx) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      //string interpolation
                      '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
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
                        DateFormat().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ]),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
