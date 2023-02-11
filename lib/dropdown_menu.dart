import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  List<String> name = ['usama', 'ahmad', 'rehan', 'ahmad', 'shaheer', 'ahmad'];
  bool isShow = true;
  String SelectOption = 'Usama';
  Color color = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: InkWell(
                onTap: () {
                  isShow = !isShow;
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(SelectOption),
                    ),
                    isShow
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
            ),
            isShow
                ? ListView(
                    primary: true,
                    shrinkWrap: true,
                    children: name
                        .map((e) => Container(
                              decoration: BoxDecoration(
                                  color: SelectOption == e
                                      ? Colors.pink
                                      : Colors.grey.shade300),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    isShow = !isShow;
                                    SelectOption = e.toString();
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList())
                : Container()
          ],
        ),
      ),
    );
  }
}
