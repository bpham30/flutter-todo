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

//tasks
class Task {
  final String name;
  bool isDone = false;

  Task({required this.name});
}

//main screen
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});


  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}


//state
class _TaskListScreenState extends State<TaskListScreen> {
  //handle input
  final TextEditingController _input = TextEditingController();

  //list of tasks
  final List<Task> _tasks = [];

  //function to add tasks
  void _addTask(String taskInput) {
    if (taskInput.isNotEmpty) {
      _tasks.add(Task(name: taskInput));
      setState(() {
        //clear input
        _input.clear();
      });
    }
  }

  //function to handle checkbox and tasks completion
  void _completeTask(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
  }

  //handle task delete
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
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
                    hintText: 'Add your task...',
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
                onPressed: () => _addTask(_input.text), child: const Icon(Icons.add),
              ),
            ],
          ),
          //list of tasks
          Expanded(
            child: _tasks.isEmpty ? (const Center(child: Text('No tasks added yet. Please add one'))) : 
            ListView.builder(
              itemCount: _tasks.length,
  
              //display list by newest task first
              itemBuilder: (context, index) => _buildTask(_tasks.length - 1 - index),
            ),
          )
        ],
      )),
           
    );
  }
  Widget _buildTask(int index) {
    return Card(
      child: ListTile(
        //add checkbox for completion
        leading: Checkbox(
          value: _tasks[index].isDone,
          onChanged: (value) { _completeTask(index); },
        ),
        //strikethrough if completed
        title: Text(_tasks[index].name, style: TextStyle(decoration: _tasks[index].isDone ? TextDecoration.lineThrough : TextDecoration.none),),
       //delete task btn
       trailing: IconButton(
         icon: const Icon(Icons.close ),
         onPressed: () => _deleteTask(index), color: Colors.red,
       ),
      ),
    );
  }
}

