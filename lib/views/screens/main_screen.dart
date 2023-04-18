import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_vendor_admain_panel/core/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      // backgroundColor: Colors.yellow.shade900,
      appBar: AppBar(
        title: Text("Management"),
        backgroundColor: Colors.yellow.shade900,
      ),
      //! sideBar
      sideBar: SideBar(items: [
        AdminMenuItem(
            title: "Dashboard",
            icon: Icons.dashboard,
            route: AppRoute.dashboardRoute),
        AdminMenuItem(
            title: "Vendors",
            icon: CupertinoIcons.person_3,
            route: AppRoute.vendorsRoute),
        AdminMenuItem(
            title: "Withdrawal",
            icon: CupertinoIcons.money_dollar,
            route: AppRoute.withdrawalRoute),
        AdminMenuItem(
            title: "Orders",
            icon: CupertinoIcons.shopping_cart,
            route: AppRoute.ordersRoute),
        AdminMenuItem(
            title: "Category",
            icon: Icons.category,
            route: AppRoute.categoriesRoute),
        AdminMenuItem(
            title: "Products", icon: Icons.shop, route: AppRoute.productsRoute),
        AdminMenuItem(
            title: "Upload Banners",
            icon: CupertinoIcons.add,
            route: AppRoute.uploadBannersRoute),
      ], selectedRoute: ''),
      body: Text("Dashboard"),
    );
  }
}
