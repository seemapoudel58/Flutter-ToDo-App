import 'package:flutter/material.dart';
import 'package:seemaflutter/screens/task_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textvalue = "";

  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Good Afternoon, Seema",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "It's Tuesday",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter a text",
                    ),
                  ),
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: "Enter a item",
                // prefixIcon: Icon(Icons.airplane_ticket),

                TextButton(
                  onPressed: () {
                    // textvalue = _formData.text;
                    todoList.add({
                      "task": _formData.text,
                      "icon": Icons.task,
                      "checked": false,
                    });
                    _formData.text = "";
                    print(_formData.text);
                    setState(() {});
                  },
                  child: Text("Add"),
                ),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    var item = todoList[index];

                    return Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: item['checked'],
                              onChanged: (value) {
                                for (var i = 0; i < todoList.length; i++) {
                                  if (todoList[i] == item) {
                                    // print(todoList[i]);
                                    setState(() {
                                      todoList[i]['checked'] =
                                          !todoList[i]['checked'];
                                    });
                                  }
                                }
                              }),
                          GestureDetector(
                              onTap: () {
                                print("tap");
                                Get.to(
                                  TaskScreen(),
                                  transition: Transition.zoom,
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => TaskScreen(),
                                //   ),
                                // );
                              },
                              child: Text(item['task'])),
                          Icon(item['icon']),
                        ],
                      ),
                    );
                  },
                ),

                // if (textvalue != "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
