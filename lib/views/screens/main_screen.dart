import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_vendor_admain_panel/core/routes.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/categories_screen.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/orders_screen.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/products_screen.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/upload_banners_screens.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //! create Widget to choose it on our body on start, then make method to
  //* connect screen with widget display

  Widget _selectedItem = DashboardScreen();

  screenSelected(item) {
    switch (item.route) {
      // case DashboardScreen.dashboardRoute: //! it's work also
      case DashboardScreen.route:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case CategoriesScreen.route:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case OrdersScreen.route:
        setState(() {
          _selectedItem = OrdersScreen();
        });
        break;
      case ProductsScreen.route:
        setState(() {
          _selectedItem = ProductsScreen();
        });
        break;
      case UploadScreen.route:
        setState(() {
          _selectedItem = UploadScreen();
        });
        break;
      case VendorScreen.route:
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case WithdrawalScreen.route:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      // backgroundColor: Colors.yellow.shade900,
      appBar: AppBar(
        title: Text("Management"),
        backgroundColor: Colors.yellow.shade900,
      ),
      //! sideBar => items && selectedRoute && onSelected
      //? headers, footers
      sideBar: SideBar(
        items: [
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
              title: "Products",
              icon: Icons.shop,
              route: AppRoute.productsRoute),
          AdminMenuItem(
              title: "Upload Banners",
              icon: CupertinoIcons.add,
              route: AppRoute.uploadBannersRoute),
        ],
        selectedRoute: '',
        //! its a function => we choose certain screen when click on it
        onSelected: (item) {
          screenSelected(item);
        },
        //? header
        header: Container(
          height: 50,
          width: double.infinity,
          color: Color(0xff444444),
          child: Center(
            child: Text(
              'BTOO STORE PANEL',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        //? footer
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Color(0xff444444),
          child: Center(
            child: Text(
              'footer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),

      //! may error becuase I am not change body not routs
      // body: Text("Dashboard"),
      body: _selectedItem,
    );
  }
}
