import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivity extends StatefulWidget {
  const InternetConnectivity({Key? key}) : super(key: key);

  @override
  State<InternetConnectivity> createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: connectivity.onConnectivityChanged,
        builder: ((context, snapshot) {
          return InternetConnectivityWidget(
            snapshot: snapshot,
          );
        }),
      ),
    );
  }
}

class InternetConnectivityWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  const InternetConnectivityWidget({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.signal_wifi_connected_no_internet_4,
                    size: 60,
                  ),
                  Text('No Internet Connection'),
                ],
              ),
            );
          default:
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.wifi,
                  size: 60,
                ),
                Text('Connected'),
              ],
            ));
        }
      default:
        return const Text('');
    }
  }
}
