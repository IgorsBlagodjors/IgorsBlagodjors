import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/accounts_screens/account_settings.dart';
import 'package:fake_tech_store/presentation/widgets/category_container.dart';
import 'package:flutter/material.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Account',
                style: AppStyles.mainHeading,
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 32,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.darkBlue,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'James Warden',
                          style: AppStyles.heading,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Premium member',
                          style: AppStyles.body1darkBlue,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CategoryContainer(
                    onTap: () {},
                    height: 53,
                    text: 'Orders',
                    textPaddingTop: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CategoryContainer(
                    onTap: () {},
                    height: 53,
                    text: 'Returns and refunds',
                    textPaddingTop: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CategoryContainer(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AccountSettings(),
                        ),
                      );
                    },
                    height: 53,
                    text: 'Account information',
                    textPaddingTop: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CategoryContainer(
                    onTap: () {},
                    height: 53,
                    text: 'Security and settings',
                    textPaddingTop: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CategoryContainer(
                    onTap: () {},
                    height: 53,
                    text: 'Help',
                    textPaddingTop: 16,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
