import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  int counter = 0;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: InputDecoration(
            hoverColor: Colors.blue,
            prefixIcon: const Icon(Icons.message),
            suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: click,
                splashColor: Colors.blue,
                tooltip: "Type a message"),
            labelText: "Type a message"),
        // onChanged: (text) => changeText(text),
      ),
      // Text(text, style: const TextStyle(fontSize: 20)),
      Container(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            onPressed: _increment,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: const Text("Add number"),
          ),
          // const Spacer(),
          ElevatedButton(
            onPressed: decrement,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orangeAccent)),
            child: const Text("Reduce number",
                style: TextStyle(color: Colors.black)),
          ),
          // const Spacer(),
          ElevatedButton(onPressed: (() => {}), child: const Text('Click me')),
        ]),
      ),
      Text(
        'The Number is: $counter',
        style: const TextStyle(fontSize: 15),
      )
    ]);
  }
}
