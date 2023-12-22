import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/app_button.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/search_widgets/edit_text.dart';
import 'package:flutter/material.dart';

class ChangeAccInfo extends StatelessWidget {
  const ChangeAccInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 29,
                  left: 20,
                ),
                child: ButtonBack(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 16,
                ),
                child: Text(
                  'Email',
                  style: AppStyles.mainHeading,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 41,
                  left: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Actual email adress',
                      style: AppStyles.body2BlackText,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'j-warden@email.com',
                      style: AppStyles.body1darkBlue,
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    Text(
                      'New email adress',
                      style: AppStyles.body2BlackText,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 71,
                        top: 8,
                      ),
                      child: EditText(
                        hint: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Confirm email adress',
                      style: AppStyles.body2BlackText,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 71,
                        top: 8,
                      ),
                      child: EditText(
                        hint: 'Email',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(
                  onPresess: () {},
                  text: 'Confirm modification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
