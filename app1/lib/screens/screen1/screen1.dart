import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Screen 1'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildContainer(
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildBox_2x2(size),
            const SizedBox(
              height: 10,
            ),
            _buildBox_3x3(size),
          ],
        ),
      ),
    );
  }

  Widget _buildBox_3x3(Size size) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 3,
                height: size.width / 3,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBox_2x2(Size size) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildContainer(
                width: size.width / 2,
                height: size.width / 2,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 2,
                height: size.width / 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: _buildContainer(
                width: size.width / 2,
                height: size.width / 2,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildContainer(
                width: size.width / 2,
                height: size.width / 2,
                color: Colors.blue,
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _buildContainer({double? width, double? height, Color? color}) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}
