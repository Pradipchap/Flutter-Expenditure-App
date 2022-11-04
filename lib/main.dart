import 'package:flutter/material.dart';
import './input.dart';

import './transaction.dart';
import 'Column.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
    Transaction(title: 'Bread', price: 40, date: DateTime.now()),
    Transaction(title: 'Milk', price: 45, date: DateTime.now())
  ];

  void _addTransaction(String name, double amt) {
    final addtx = Transaction(title: name, price: amt, date: DateTime.now());

    setState(() {
      _transaction.add(addtx);
    });
  }

  void _clickfloatingButton(BuildContext ctx) {
    
    showModalBottomSheet(
      
        context: ctx,
        builder: (bCtx) {
          return Input(click: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => _clickfloatingButton(context),
            icon: Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          // Input(click: _addTransaction),
          ColumnList(
            trans: _transaction,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _clickfloatingButton(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
