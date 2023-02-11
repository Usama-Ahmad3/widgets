import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  List<String> name = ['usama', 'ahmad', 'rehan', 'ahmad', 'shaheer', 'ahmad'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReorderableListView.builder(
            itemBuilder: (context, index) {
              return Card(
                key: ValueKey(index),
                child: ListTile(
                  title: Text(name[index]),
                ),
              );
            },
            itemCount: name.length,
            onReorder: ((oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }
                final element = name.removeAt(oldIndex);
                name.insert(newIndex, element);
              });
            })));
  }
}
