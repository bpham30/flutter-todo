import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
//main screen
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});


  @override
  _TaskListScreen createState() => _TaskListScreen();
}

class _TaskListScreen extends State<TaskListScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        
      
      ),
      body:  Padding(padding: const EdgeInsets.all(8.0), child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                //input field
                child: TextField(
                  decoration: InputDecoration(
                    
                    hintText: 'Enter your task...',
                  ),
                ),
              ),
              //add button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  iconColor: Colors.white,
                ),
                //implement add logic
                onPressed: () {}, child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      )),
           
    );
  }
}

