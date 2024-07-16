import 'package:ebconnect_test/provider/resolution_provider.dart';
import 'package:ebconnect_test/widgets/checkin.dart';
import 'package:ebconnect_test/widgets/resolution_activity_log.dart';
import 'package:ebconnect_test/widgets/resolution_name.dart';
import 'package:ebconnect_test/widgets/resolution_phone_number.dart';
import 'package:ebconnect_test/widgets/resolution_role.dart';
import 'package:ebconnect_test/widgets/resolution_site_accessible.dart';
import 'package:ebconnect_test/widgets/resolution_site_visit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResolutionScreen extends StatefulWidget {
  const ResolutionScreen({super.key, required this.groupQuestionId});

  final int groupQuestionId;

  static String routeName = '/resolution';

  @override
  State<ResolutionScreen> createState() => _ResolutionScreenState();
}

class _ResolutionScreenState extends State<ResolutionScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final logController = TextEditingController();

  @override
  void initState() {
    context
        .read<ResolutionProvider>()
        .fetchForm(context, groupQuestionId: widget.groupQuestionId);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    logController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResolutionProvider>(
      builder: (context, resolutionProvider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Resolution'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                resolutionProvider.save(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  ...resolutionProvider.listFormModel.map((e) {
                    if (e.groupQuestionId == 10) {
                      return Checkin(
                        onPressed: () {
                          resolutionProvider.checkIn(context);
                        },
                      );
                    } else if (e.groupQuestionId == 11) {
                      return ResolutionSiteVisit(
                        listSiteVisitPurpose:
                            resolutionProvider.listSiteVisitPurpose,
                        selectSiteVisitPurpose:
                            resolutionProvider.selectSiteVisitPurpose,
                        onChanged:
                            resolutionProvider.setSelectedSiteVisitPurpose,
                      );
                    } else if (e.groupQuestionId == 12) {
                      return ResolutionName(
                        nameController: nameController,
                        onChanged: (value) {
                          resolutionProvider.setName(value);
                        },
                      );
                    } else if (e.groupQuestionId == 13) {
                      return ResolutionPhoneNumber(
                        phoneNumberController: phoneNumberController,
                        onChanged: (value) {
                          resolutionProvider.setPhoneNumber(value);
                        },
                      );
                    } else if (e.groupQuestionId == 14) {
                      return ResolutionRole(
                        roles: resolutionProvider.roles,
                        selectRole: resolutionProvider.selectRole,
                        onChanged: resolutionProvider.setSelectedRole,
                      );
                    } else if (e.groupQuestionId == 15) {
                      return ResolutionActivityLog(
                        logController: logController,
                        onChanged: (value) {
                          resolutionProvider.setLogActivity(value);
                        },
                      );
                    } else if (e.groupQuestionId == 16) {
                      return ResolutionSiteAccessible(
                        listSiteAccessible:
                            resolutionProvider.listSiteAccessible,
                        selectSiteAccessible:
                            resolutionProvider.selectSiteAccessible,
                        onChanged: resolutionProvider.setSelectedSiteAccessible,
                      );
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
