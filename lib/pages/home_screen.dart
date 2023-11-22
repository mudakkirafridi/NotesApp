import 'package:flutter/material.dart';
import 'package:notes_app/widgets/listtile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currenIndex;
  List<String> listData = [];
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 222, 222),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Whats on your mind?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            listData.isEmpty
                // ? const Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //         Center(
                //           child: Image(
                //               image: AssetImage('assets/images/void.png')),
                //         ),
                //       ])
                ? const Center(
                    child: Column(
                    children: [
                      Text(
                        'Note: This App Is Not Store Parmanent Data \n And Add Your Notes Then Click The + Button',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.hourglass_empty,
                        size: 45,
                        color: Colors.black,
                      ),
                    ],
                  ))
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * .8,
                    child: ListView.builder(
                        itemCount: listData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.today_outlined),
                            title: Text(listData[index]),
                            subtitle: const Text('10.07pm'),
                            trailing: Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      listData.removeAt(index);
                                      setState(() {});
                                    },
                                    child: const Icon(Icons.delete)),
                              ],
                            ),
                          );
                        }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currenIndex == null) {
            listData.add(noteController.text.toString());
            noteController.clear();
            setState(() {});
          } else {
            var existingPost = listData[currenIndex];
            existingPost = noteController.text;
            setState(() {
              currenIndex = existingPost;
              currenIndex = null;
            });
          }
        },
        child: Icon(currenIndex != null ? Icons.edit : Icons.add),
      ),
    );
  }
}
