import 'package:flutter/material.dart';
import 'package:widgets/country_picker.dart';
import 'package:widgets/draggable_widget.dart';
import 'package:widgets/dropdown_menu.dart';
import 'package:widgets/future_builder.dart';
import 'package:widgets/internet_connectivity.dart';
import 'package:widgets/stream_Chat.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Widgets'),
            bottom: const TabBar(
              tabs: [
                Text('Future'),
                Text('Draggable'),
                Text('Stream'),
                Text('Connectivity'),
                Text('DropDown'),
                Text('Country')
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              FutureBuilderScreen(),
              DraggableWidget(),
              StreamChat(),
              InternetConnectivity(),
              DropDownMenu(),
              CountryPicker()
            ],
          ),
        ));
  }
}
