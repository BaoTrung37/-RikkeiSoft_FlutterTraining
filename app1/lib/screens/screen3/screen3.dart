import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material design Dialogs'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: SizedBox(
                  height: 330,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const FlutterLogo(
                        size: 150,
                      ),
                      const Text(
                        'Congratulations',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Congratulations, you won 500 points',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton.icon(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                            textColor: Colors.grey,
                            label: const Text("Cancel"),
                          ),
                          RaisedButton.icon(
                            color: Colors.blue,
                            textColor: Colors.white,
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            label: const Text("Claim"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Text(
            'Show Dialog',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
