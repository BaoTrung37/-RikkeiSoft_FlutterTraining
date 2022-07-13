import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';
import '../post/post_screen.dart';
import '../user/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    const PostScreen(),
    const UserScreen(),
  ];

  var currentIndex = 0;
  void selectPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(pages, currentIndex),
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        onChangePage: selectPage,
      ),
    );
  }

  Widget _buildBody(List<Widget> pages, int currentIndex) {
    // print(currentIndex);
    return Center(
      child: pages.elementAt(currentIndex),
    );
  }
}
