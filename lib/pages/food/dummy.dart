import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late ScrollController _scrollController;

  List<Map<String, List<String>>> _tablist = [ 
       {  "tab1": [        "Tab11",        "tab12",        "tab13",        "tab14",      ]
    },
    {
      "tab2": [        "Tab21",        "tab22",        "tab23","tab24",       ]
    },
     {  "tab3": [        "Tab31",        "tab32",       ]
    },
    {
      "tab4": [        "Tab41",        "tab42",        "tab43","tab44",       ]
    },
    
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _tablist.length);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      int index = (_scrollController.offset /
              (_scrollController.position.maxScrollExtent / _tablist.length))
          .floor();
      _controller.animateTo(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _tablist.map((item) => Tab(text: item.keys.first)).toList(),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _tablist.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                color: _controller.index == index ? Colors.grey[200] : null,
                padding: EdgeInsets.all(16),
                child: Text(
                  _tablist[index].keys.first,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ..._tablist[index].values.first.map((item) => ListTile(title: Text(item))).toList()
            ],
          );
        },
      ),
    );
  }
}
