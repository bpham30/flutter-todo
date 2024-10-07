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
  //handle input
  final TextEditingController _input = TextEditingController();

  void _addTask() {
    final task = _input.text;
    if (task.isNotEmpty) {
      //add task to list
      print(task);
      setState(() {
        //clear input field
        _input.clear();
      });
    }
  }


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
              Expanded(
                //input field
                child: TextField(
                  controller: _input,
                  decoration: const InputDecoration(
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
                onPressed: () => _addTask(), child: const Icon(Icons.add),
              ),
            ],
          ),
          //list of tasks
          const Expanded(child: Center( child: Text("No Tasks"),),)
        ],
      )),
           
    );
  }
}

