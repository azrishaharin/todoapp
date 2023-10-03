import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();

  List _listItem = [
    ["Go to gym", false],
    ["Update instagram and facebook page", false],
  ];

  void saveNewTask() {
    setState(() {
      _listItem.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(controller: _controller, onSave: saveNewTask);
        });
  }

  void deleteTask(int index) {
    setState(() {
      _listItem.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    padding: const EdgeInsets.all(16),
                    child: Row(children: [
                      Checkbox(
                          value: _listItem[index][1],
                          onChanged: (bool? newValue) {
                            setState(() {
                              _listItem[index][1] = newValue!;
                            });
                          }),
                      Expanded(child: Text(_listItem[index][0])),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _listItem.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ]),
                  ),
                );
              },
              itemCount: _listItem.length,
            ),
          ),
        ],
      )),
    );
  }
}
