import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveNavController extends GetxController {
  var isMobile = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkDevice();
  }

  void checkDevice() {
    if (GetPlatform.isMobile || Get.width < 600) {
      isMobile.value = true;
    } else {
      isMobile.value = false;
    }
  }
}

class ResponsiveNavBar extends StatelessWidget {
  ResponsiveNavBar({Key? key}) : super(key: key);

  final ResponsiveNavController controller = Get.put(ResponsiveNavController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Home'},
    {'icon': Icons.person, 'title': 'Profile'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.help, 'title': 'Help'},
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: scaffoldKey,
        
        // App Bar for desktop view
        appBar: controller.isMobile.value
            ? AppBar(
                title: const Text('My App'),
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // Ensure currentState is not null
                      if (scaffoldKey.currentState != null) {
                        scaffoldKey.currentState!.openDrawer();
                      }
                    },
                  ),
                ),
              )
            : AppBar(
                title: const Text('My App'),
                actions: menuItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(item['icon'], color: Colors.white),
                      label: Text(
                        item['title'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
        
        // Drawer for mobile view
        drawer: controller.isMobile.value
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'My App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ...menuItems.map((item) {
                      return ListTile(
                        leading: Icon(item['icon']),
                        title: Text(item['title']),
                        onTap: () {
                          Get.back(); // Close drawer
                          // Add navigation logic here
                        },
                      );
                    }).toList(),
                  ],
                ),
              )
            : null,
        body: Container(
          // Your page content goes here
          child: const Center(
            child: Text('Page Content'),
          ),
        ),
      );
    });
  }
}


