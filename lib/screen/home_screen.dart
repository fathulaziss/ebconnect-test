import 'package:ebconnect_test/provider/home_provider.dart';
import 'package:ebconnect_test/screen/resolution_screen.dart';
import 'package:ebconnect_test/screen/restore_screen.dart';
import 'package:ebconnect_test/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().fetchMenu(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Ebconnect Test'),
          ),
          body: homeProvider.listMenu.isNotEmpty
              ? ListView.builder(
                  itemCount: homeProvider.listMenu.length,
                  itemBuilder: (context, index) {
                    final menu = homeProvider.listMenu[index];
                    return ListTile(
                      onTap: () async {
                        if (menu.groupQuestionId == 132) {
                          final res = await NavigationService.pushNamed(
                            RestoreScreen.routeName,
                            arguments: menu.groupQuestionId,
                          );
                          homeProvider.setRestoreData(res);
                        } else if (menu.groupQuestionId == 132) {
                          final res = await NavigationService.pushNamed(
                            ResolutionScreen.routeName,
                            arguments: menu.groupQuestionId,
                          );
                          homeProvider.setResolutionData(res);
                        }
                      },
                      leading: Text(
                        menu.name ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: (menu.groupQuestionId == 132 &&
                              homeProvider.restoreData.address != null)
                          ? const Icon(Icons.check, color: Colors.green)
                          : (menu.groupQuestionId == 132 &&
                                  homeProvider.resolutionData.address != null)
                              ? const Icon(Icons.check, color: Colors.green)
                              : const SizedBox(),
                    );
                  },
                )
              : Center(
                  child: InkWell(
                    onTap: () async {
                      final res = await NavigationService.pushNamed(
                        ResolutionScreen.routeName,
                        arguments: 132,
                      );
                      homeProvider.setResolutionData(res);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Data Kosong'),
                        (homeProvider.resolutionData.address != null)
                            ? const Icon(Icons.check, color: Colors.green)
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
