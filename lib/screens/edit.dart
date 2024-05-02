import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();


  @override
  void initState() {

    if(widget.note!=null){
       _titleController = TextEditingController(text: widget.note!.title);
       _noteController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(children: [

          // App BAr
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView(
              children: [

                // Title text
                TextField(
                  controller: _titleController,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                  ),
                ),

                // Note text
                TextField(
                  maxLines: null,
                  controller: _noteController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a new note',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),

              ],
            ),),

        ],),
      ),

      // Save button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop<List<String>>(context, [
            _titleController.text,
            _noteController.text
          ]);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          color: Colors.white,
          Icons.save,
          size: 30,
        ),
      ),

    );
  }
}
