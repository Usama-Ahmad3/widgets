import 'dart:async';

import 'package:flutter/material.dart';

class StreamChat extends StatefulWidget {
  const StreamChat({Key? key}) : super(key: key);

  @override
  State<StreamChat> createState() => _StreamChatState();
}

class _StreamChatState extends State<StreamChat> {
  List<String> listt = [];
  Steam streamm = Steam();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder(
          stream: streamm.getResponce,
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: listt.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          title: Text(snapshot.data![index].toString()),
                          trailing: IconButton(
                            onPressed: () {
                              listt.removeAt(index);
                              streamm.addResponce(listt);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text(snapshot.error.toString());
              }
            } else {
              return Text(snapshot.error.toString());
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration:
                    const InputDecoration(hintText: 'Enter Text Message'),
              ),
            ),
            TextButton(
                onPressed: () {
                  listt.add(messageController.text.toString());
                  streamm.addResponce(listt);
                  messageController.clear();
                },
                child: const Icon(Icons.send))
          ],
        )
      ],
    );
  }
}

class Steam {
  final _stream = StreamController<List<String>>.broadcast();
  void Function(List<String>) get addResponce => _stream.sink.add;
  Stream<List<String>> get getResponce => _stream.stream.asBroadcastStream();
}
