import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebar_navigation_animation/bloc/navigation_bloc.dart';
import 'package:sidebar_navigation_animation/pages/my_account.dart';
import 'package:sidebar_navigation_animation/pages/my_orders.dart';

import '../pages/home_page.dart';
import 'sidebar.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (BuildContext context, NavigationState state) {

                switch(state) {
                  case HomePageNavigationState():
                    return const HomePage();
                    break;

                  case MyAccountNavigationState():
                    return const MyAccount();
                    break;

                  case MyOrdersNavigationState():
                    return const MyOrders();
                    break;

                  default:
                    return const HomePage();
                    break;
                }


              },
            ),
            const SideBar(),
          ],
        ),
      ),
    );
  }
}
