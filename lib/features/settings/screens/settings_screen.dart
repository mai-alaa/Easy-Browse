import 'package:easy_browse/core/extentions/int_extentions.dart';
import 'package:easy_browse/core/utils/constants.dart';
import 'package:easy_browse/features/settings/widgets/custom_txt_form.dart';
import 'package:easy_browse/features/settings/widgets/submit_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
   SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Browse Settings'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SubmitButton(onTap: (){}, text: 'Submit', buttonColor: kPrimaryColor, txtColor: kBackgroundColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormFeiled(text: 'Enter The URL', controller: controller),
            10.toHeight,
            
        
            
          ],
        ),
      ),
    );
  }
}