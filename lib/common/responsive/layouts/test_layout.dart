import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransparentAppBarDemo extends StatefulWidget {
  const TransparentAppBarDemo({super.key});

  @override
  _TransparentAppBarDemoState createState() => _TransparentAppBarDemoState();
}

class _TransparentAppBarDemoState extends State<TransparentAppBarDemo> {
  bool _isVisible = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: _isVisible
                ? Colors.transparent
                : Colors.blue, // Set transparent background when visible
            floating: true,
            snap: true,
            pinned: true,
            elevation: 0,
            leading: const Icon(Icons.menu),
            title: const Text('Transparent AppBar Demo'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
