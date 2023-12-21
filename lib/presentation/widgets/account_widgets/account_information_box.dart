import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/grey_text.dart';
import 'package:flutter/material.dart';

class AccountInformationBox extends StatelessWidget {
  final String topText;
  final String bottomText;
  final Function() onTap;
  const AccountInformationBox({
    super.key,
    required this.topText,
    required this.bottomText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topText,
              style: AppStyles.body2BlackText,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 56,
              ),
              child: GestureDetector(
                onTap: onTap,
                child: const GreyTextWidget(
                  text: 'Change',
                  textSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          bottomText,
          style: AppStyles.body1darkBlue,
        ),
      ],
    );
  }
}
