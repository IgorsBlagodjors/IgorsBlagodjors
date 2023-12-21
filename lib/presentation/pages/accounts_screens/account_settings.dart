import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/accounts_screens/change_acc_info.dart';
import 'package:fake_tech_store/presentation/widgets/account_widgets/account_information_box.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                'Account information',
                style: AppStyles.body2BlackText,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Column(
                children: [
                  AccountInformationBox(
                    onTap: () {},
                    topText: 'User name',
                    bottomText: 'James Warden',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AccountInformationBox(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChangeAccInfo(),
                        ),
                      );
                    },
                    topText: 'Email',
                    bottomText: 'j-warden@email.com',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AccountInformationBox(
                    onTap: () {},
                    topText: 'Phone number',
                    bottomText: '+33 6 16 39 54 78',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AccountInformationBox(
                    onTap: () {},
                    topText: 'Password',
                    bottomText: '*******************',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AccountInformationBox(
                    onTap: () {},
                    topText: 'Account type',
                    bottomText: 'Premium',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
