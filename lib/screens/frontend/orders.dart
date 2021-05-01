// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:login/widgets/widgets.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  int itemCount = 15;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Scrollbar(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              backgroundColor: bottomBar,

              // elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'lib/assets/images/order.jpg',
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.95),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ))
                  ],
                ),
                centerTitle: true,
                title: Text(
                  'My Orders',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Center(
                      child: Stack(children: [
                        ListTile(
                          isThreeLine: true,
                          title: Text('${index + 1} item of the list'),
                          subtitle: Column(
                            children: [
                              Text('Press here to check order'),
                              Text('If You are interested to'),
                              Text('see how Your clothes'),
                              Text('are going'),
                              Text('Thank You!')
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          leading: Icon(Icons.pan_tool_outlined),
                          onTap: () {},
                        ),
                        // buildDivider()
                      ]),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: floatingButton,
          elevation: 10,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
