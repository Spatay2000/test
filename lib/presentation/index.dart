import 'package:flutter/material.dart';
import 'package:rescue_spot/shared/app_bar.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: CustomAppBar(),
            ),
            body: Container(),
          );
        } else {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: CustomAppBar(),
            ),
            body: Container(),
          );
        }
      },
    );
  }
}
