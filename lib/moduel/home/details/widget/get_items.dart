import 'package:flutter/material.dart';

class GetItems extends StatefulWidget {
  Map tasks;
   GetItems({ Key? key, required this.tasks }) : super(key: key);

  @override
  _GetItemsState createState() => _GetItemsState();
}

class _GetItemsState extends State<GetItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
    mainAxisAlignment:MainAxisAlignment.spaceAround,
    children: [
      IconButton(onPressed: (){

      },
       icon: Icon(Icons.delete,
       color: Colors.red,
       )),
         Text(widget.tasks['count'].toString()),
         Text(widget.tasks['washingKind'].toString()),
    
    ],
  ),
    );
  }
}