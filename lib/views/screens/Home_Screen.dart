import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/cubit/NavigationCubit.dart';
import 'package:slash/cubit/SharedCubit.dart';
import 'package:slash/data/repositories/SharedRepo.dart';
import 'package:slash/viewmodels/SharedViewModel.dart';
import 'package:slash/views/widgets/BuildNavItem.dart';
import 'package:slash/views/widgets/CarouselWithIndicator.dart';
import 'package:slash/views/widgets/TextHeader.dart';
import 'package:slash/views/widgets/HorizontalSliderButton.dart';
import 'package:slash/views/widgets/CustomSearchField.dart';
import 'package:slash/views/widgets/GridViewWidget.dart';
import 'package:slash/views/widgets/IconTextWidget.dart';
import 'package:slash/views/widgets/ListItems.dart';
import 'package:slash/views/widgets/inventory.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    final repository = ItemRepository();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 74.0, left: 24, right: 24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // Web Layout and Tablet Layout
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Slash.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Image.asset(Inventory.locationIcon,
                                  width: 24.0, height: 24.0),
                              const SizedBox(width: 5),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nasr City',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Cairo',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Image.asset(Inventory.arrowDownIcon,
                                  width: 30.0, height: 30.0),
                            ],
                          ),
                          const Spacer(),
                          Stack(
                            children: [
                              Image.asset(Inventory.notificationIcon,
                                  width: 30.0, height: 30.0),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Expanded(child: CustomSearchField(type: 'Web',)),
                          SizedBox(width: 8.0),
                          HorizontalSliderButton(),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const CarouselWithIndicator(),
                      const TextHeader(title: 'Categories', type: 'Web'),
                      const SizedBox(height: 16),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            IconTextWidget(
                                iconPath: Inventory.shirtIcon,
                                label: 'Fashion'),
                            IconTextWidget(
                                iconPath: Inventory.diceIcon,
                                label: 'Games'),
                            IconTextWidget(
                                iconPath: Inventory.glassesIcon,
                                label: 'Accessories'),
                            IconTextWidget(
                                iconPath: Inventory.bookBlankIcon,
                                label: 'Books'),
                            IconTextWidget(
                                iconPath: Inventory.paletteIcon,
                                label: 'Artifacts'),
                            IconTextWidget(
                                iconPath: Inventory.pinataIcon,
                                label: 'Pets Care'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const TextHeader(title: 'Best Selling', type: 'Web'),
                      const SizedBox(height: 16.0),
                      GridViewWidget(
                        viewModel: ItemViewModel(
                          cubit: ItemCubit(
                              repository: repository, type: 'bestSelling'),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      const TextHeader(title: 'New Arrival', type: 'Web',),
                      const SizedBox(height: 16.0),
                      GridViewWidget(
                        viewModel: ItemViewModel(
                          cubit: ItemCubit(
                              repository: repository, type: 'newArrival'),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      const TextHeader(title: 'Recommended for you', type: 'Web'),
                      const SizedBox(height: 16.0),
                      GridViewWidget(
                        viewModel: ItemViewModel(
                          cubit: ItemCubit(
                              repository: repository,
                              type: 'recommendedForYou'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // Mobile layout
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Slash.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Urbanist',
                            )),
                        Row(
                          children: [
                            Image.asset(Inventory.locationIcon,
                                width: 24.0, height: 24.0),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nasr City',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Cairo',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Image.asset(Inventory.arrowDownIcon,
                                width: 30.0, height: 30.0),
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(Inventory.notificationIcon,
                                width: 30.0, height: 30.0),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(child: CustomSearchField(type: 'Mobile',)),
                        SizedBox(width: 8.0),
                        HorizontalSliderButton(),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const CarouselWithIndicator(),
                    const TextHeader(title: 'Categories',type: 'Mobile',),
                    const SizedBox(height: 16),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          IconTextWidget(
                              iconPath: Inventory.shirtIcon,
                              label: 'Fashion'),
                          IconTextWidget(
                              iconPath: Inventory.diceIcon,
                              label: 'Games'),
                          IconTextWidget(
                              iconPath: Inventory.glassesIcon,
                              label: 'Accessories'),
                          IconTextWidget(
                              iconPath: Inventory.bookBlankIcon,
                              label: 'Books'),
                          IconTextWidget(
                              iconPath: Inventory.paletteIcon,
                              label: 'Artifacts'),
                          IconTextWidget(
                              iconPath: Inventory.pinataIcon,
                              label: 'Pets Care'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const TextHeader(title: 'Best Selling', type: 'Mobile'),
                    const SizedBox(height: 16.0),
                    ListItemWidgets(
                      viewModel: ItemViewModel(
                        cubit: ItemCubit(
                            repository: repository, type: 'bestSelling'),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    const TextHeader(title: 'New Arrival', type: 'Mobile'),
                    const SizedBox(height: 16.0),
                    ListItemWidgets(
                      viewModel: ItemViewModel(
                        cubit: ItemCubit(
                            repository: repository, type: 'newArrival'),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    const TextHeader(title: 'Recommended for you', type: 'Mobile',),
                    const SizedBox(height: 16.0),
                    ListItemWidgets(
                      viewModel: ItemViewModel(
                        cubit: ItemCubit(
                            repository: repository, type: 'recommendedForYou'),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: BuildBottomNavItem(
                    Inventory.homeIcon, 'Home', 0, selectedIndex),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem(
                    Inventory.heartIcon, 'Favorites', 1, selectedIndex),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem(Inventory.shoppingCartIcon, 'My Cart',
                    2, selectedIndex),
                label: 'My Cart',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem(Inventory.profileIcon, 'Profile',
                    3, selectedIndex),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            onTap: (index) => context.read<NavigationCubit>().setPage(index),
          );
        },
      ),
    );
  }
}
