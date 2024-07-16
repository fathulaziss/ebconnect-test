import 'package:ebconnect_test/provider/restore_provider.dart';
import 'package:ebconnect_test/widgets/checkin.dart';
import 'package:ebconnect_test/widgets/restore_description.dart';
import 'package:ebconnect_test/widgets/restore_take_photo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestoreScreen extends StatefulWidget {
  const RestoreScreen({super.key, required this.groupQuestionId});

  final int groupQuestionId;

  static String routeName = '/restore';

  @override
  State<RestoreScreen> createState() => _RestoreScreenState();
}

class _RestoreScreenState extends State<RestoreScreen> {
  final descriptionController = TextEditingController();

  @override
  void initState() {
    context
        .read<RestoreProvider>()
        .fetchForm(context, groupQuestionId: widget.groupQuestionId);
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestoreProvider>(
      builder: (context, restoreProvider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Restore'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                restoreProvider.save(context);
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
                  ...restoreProvider.listFormModel.map((e) {
                    if (e.groupQuestionId == 131) {
                      return Checkin(
                        onPressed: () {
                          restoreProvider.checkIn(context);
                        },
                      );
                    } else if (e.groupQuestionId == 135) {
                      return RestoreDescription(
                        descriptionController: descriptionController,
                        onChanged: (value) {
                          restoreProvider.setDescription(value);
                        },
                      );
                    } else if (e.groupQuestionId == 136) {
                      return RestoreTakePhoto(
                        onPressed: () {
                          restoreProvider.takePhoto(context);
                        },
                        photos: restoreProvider.photos,
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
