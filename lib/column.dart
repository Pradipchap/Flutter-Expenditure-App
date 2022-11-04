import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class ColumnList extends StatelessWidget {
  final List<Transaction> trans;

  ColumnList({required this.trans, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      
        child: ListView(
          children: trans.map((e) {
            return Card(
              
              child: Container(
                
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2)),
                      margin:const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                      padding:const EdgeInsets.all(5),
                      child: Text('\$${e.price.toStringAsPrecision(3)}',style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin:const EdgeInsets.only(left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(e.title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),), Text(DateFormat.yMMMd().format(e.date),style: const TextStyle(fontSize: 20),)],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      
    );
  }
}
