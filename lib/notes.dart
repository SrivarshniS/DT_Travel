import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  void _loadNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller.text = prefs.getString('note') ?? "";
    });
  }

  void _saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('note', _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: "Write your notes here..."),
              ),
            ),
            ElevatedButton(onPressed: _saveNote, child: Text("Save Note"))
          ],
        ),
      ),
    );
  }
}
