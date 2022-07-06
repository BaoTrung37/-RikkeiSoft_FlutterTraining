import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final String name;
  const ItemView({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            minRadius: 20,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
