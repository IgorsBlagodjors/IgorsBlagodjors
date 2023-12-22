import 'package:fake_tech_store/presentation/widgets/grey_text.dart';
import 'package:flutter/material.dart';

class LastSearchLW extends StatelessWidget {
  final List<String> lastestSearch;
  const LastSearchLW({super.key, required this.lastestSearch});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: lastestSearch.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Expanded(
                child: Wrap(
                  children: [
                    GreyTextWidget(
                      text: lastestSearch[index],
                      textSize: 16,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 13.19),
                    child: Image.asset('assets/icons/erase_icon.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
