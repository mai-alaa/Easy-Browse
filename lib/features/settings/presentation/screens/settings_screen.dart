import 'package:easy_browse/config/routes/routes.dart';
import 'package:easy_browse/core/extentions/int_extentions.dart';
import 'package:easy_browse/core/utils/common_helper.dart';
import 'package:easy_browse/core/utils/constants.dart';
import 'package:easy_browse/features/settings/presentation/widgets/custom_txt_form.dart';
import 'package:easy_browse/features/settings/presentation/widgets/scan_devices_dropdown.dart';
import 'package:easy_browse/features/settings/presentation/widgets/submit_button.dart';
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
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: 
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormFeiled(text: 'Enter The URL', controller: controller),
            10.toHeight,
            ScanDevices(),
            Spacer(),
            SubmitButton(onTap: (){
            String url = controller.text.trim();

            if (url.isEmpty) {
              showToast('Please enter a URL', Colors.red);
              return;
            }

           
        Navigator.pushNamed(context, AppRouter.webViewScreen, arguments: controller.text);  
        }, text: 'Submit', buttonColor: kPrimaryColor, txtColor: kBackgroundColor),

          ],
        ),
      ),
    );
  }
}

