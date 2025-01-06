import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/root/widgets/new_songs.dart';

import '../../../core/config/assets/app_vectors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homeTopBanner(),
              const SizedBox(
                height: 41,
              ),
              _tabs(),
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewSongs(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeTopBanner() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Album',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              SizedBox(height: 4),
              Text(
                'Happier Than \nEver',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Billie Eilish',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 35,
          child: Image.asset(
            AppImages.topBannerImg,
          ),
        )
      ],
    );
  }

  Widget _tabs() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
      child: TabBar(
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        controller: _tabController,
        isScrollable: true,
        dividerColor: Colors.transparent,
        tabs: const [
          Text(
            'New',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Video',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Artist',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Podcast',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
