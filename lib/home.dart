import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> Tasks = new List();
  List<String> Tasks2 = new List();
  String enter = '';
  String enter2 = '';

  @override
  void initState() {
    super.initState();
    int index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            children: [
              Text("Daily",
                  style: TextStyle(
                    color: Colors.black87,
                  )),
              Text("Tasks",
                  style: TextStyle(
                    color: Colors.blue,
                  ))
            ],
          )),
      body: ListView.builder(
          itemCount: Tasks.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              key: Key(Tasks[index]),
              child: Card(
                  elevation: 5.0,
                  child: Container(
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Tasks[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(Tasks2[index],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue)),
                        ),
                        SizedBox(height: 50),
                        Row(children: [
                          SizedBox(width: 270),
                          Text("Slide to delete"),
                          Icon(Icons.arrow_right),
                        ])
                      ],
                    ),
                  )),
              onDismissed: (direction) {
                Tasks.removeAt(index);
                Tasks2.removeAt(index);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add your task"),
                  content: Container(
                    height: 150,
                    child: Column(
                      children: [
                        Text("Enter the task name"),
                        TextField(
                          onChanged: (String value) {
                            enter = value;
                          },
                        ),
                        SizedBox(height: 15),
                        Text("Enter the date/time"),
                        TextField(
                          onChanged: (String value) {
                            enter2 = value;
                          },
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(
                          () {
                            Tasks.add(enter);
                            Tasks2.add(enter2);
                          },
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
