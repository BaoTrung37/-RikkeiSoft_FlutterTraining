import 'package:app1/screens/screen2/widgets/item_view.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listA = ['Yohn', 'Beth'];
    final listB = ['Will', 'Miranda'];
    final listC = ['Mike', 'Danny'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped List View Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Team A',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemView(name: listA[index]);
              },
              itemCount: listA.length,
            ),
            const SizedBox(height: 10),
            const Text(
              'Team B',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemView(name: listB[index]);
              },
              itemCount: listB.length,
            ),
            const SizedBox(height: 10),
            const Text(
              'Team C',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemView(name: listC[index]);
              },
              itemCount: listC.length,
            ),
          ],
        ),
      ),
    );
  }
}
