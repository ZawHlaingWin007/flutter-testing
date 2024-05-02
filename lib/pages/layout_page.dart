import "package:flutter/material.dart";
import "package:new_flutter_app/util/custom_appbar.dart";
import "package:new_flutter_app/util/sidebar.dart";

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Layouting'),
      drawer: Sidebar(),
      body: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Colors.green,
        width: 5,
      ),
      color: Colors.deepPurple,
    );
    return Container(
      decoration: boxDecoration,
      child: const Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Square(
            size: 200,
          ),
          Square(
            size: 150,
          ),
          Square(),
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
  final double size;
  const Square({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        color: Colors.black,
      ),
      width: size,
      height: size,
      child: const Icon(
        Icons.fireplace_outlined,
        color: Colors.amber,
      ),
    );
  }
}
