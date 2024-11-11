import 'package:flutter/material.dart';

import 'package:scrollable_landing_page/ui/views/about_view.dart';
import 'package:scrollable_landing_page/ui/views/contact_view.dart';
import 'package:scrollable_landing_page/ui/views/home_view.dart';
import 'package:scrollable_landing_page/ui/views/location_view.dart';
import 'package:scrollable_landing_page/ui/views/pricing_view%20copy.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Stack(
            children: [
              
              _HomeBody(),

              Positioned(right: 20, top: 20,
                child: Container(
                width: 150,
                height: 50,
                color: Colors.black,
              ))
            ],
          ),
        )
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}