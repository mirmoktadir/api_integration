import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data from net'),
        centerTitle: true,
        backgroundColor: Colors.blue[50],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Text('Api Integration'),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: const Text(''),
            )
          ],
        ),
      ),
    );
  }
}
