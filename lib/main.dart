import 'package:flutter/material.dart';
import 'package:to_do_list/catatan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController JudulCtrl = TextEditingController();
  TextEditingController IsiCtrl = TextEditingController();
  List<Catatan> dataCatatan = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Catatan Pagi"),
            centerTitle: true,
          ),
          body: Container(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Judul Catatan"),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Isi Catatan"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          JudulCtrl.clear();
                          IsiCtrl.clear();
                        },
                        child: Text("Clear")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dataCatatan.add(Catatan(
                                Judul: JudulCtrl.text, Isi: IsiCtrl.text));
                            JudulCtrl.clear();
                            IsiCtrl.clear();
                          });
                        },
                        child: Text("Submit")),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.event_note,
                              color: Colors.deepOrange,
                            ),
                            title: Text(dataCatatan[index].Judul),
                            subtitle: Text(dataCatatan[index].Isi),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                )),
                          );
                        }))
              ],
            ),
          )),
    );
  }
}
