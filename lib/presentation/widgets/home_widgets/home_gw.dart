import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/pages/search_section/selected_good.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/add_to_favorite_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeGW extends StatefulWidget {
  final List<Electronics> data;
  final bool isLoading;
  final ScrollController scrollController;
  final Axis selectedDirection;
  final bool textOverflow;
  const HomeGW(
      {super.key,
      required this.data,
      required this.isLoading,
      required this.scrollController,
      required this.selectedDirection,
      required this.textOverflow});

  @override
  State<HomeGW> createState() => _HomeGWState();
}

class _HomeGWState extends State<HomeGW> {
  late final ElectronicsRepository _electronicsRepository;

  @override
  void initState() {
    super.initState();
    _electronicsRepository = context.read();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty && !widget.isLoading) {
      return const Expanded(
        child: Center(
          child: Text('Nothing found'),
        ),
      );
    }
    return Expanded(
      child: GridView.builder(
        controller: widget.scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 8,
          mainAxisExtent: 196,
        ),
        scrollDirection: widget.selectedDirection,
        itemCount: widget.data.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectedGood(
                  singleGood: widget.data[index],
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 24,
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 143,
                      width: double.infinity,
                      color: AppColors.whiteColor,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: widget.data[index].imageUrl,
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.green),
                                strokeWidth: 5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        widget.data[index].title,
                        overflow:
                            widget.textOverflow ? TextOverflow.ellipsis : null,
                        style: AppStyles.font16Weight600.copyWith(
                          color: AppColors.blackText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        left: 12,
                      ),
                      child: Text(
                        '${widget.data[index].currency} ${widget.data[index].priceValue}',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.font12Weight500.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: AddToFavoriteStarIcon(
                  mutable: false,
                  onPressed: () {
                    _electronicsRepository.addCheckAndFaveItem(
                        widget.data[index], true);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
