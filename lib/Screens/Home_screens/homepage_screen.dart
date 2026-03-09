import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Customcards/customcard_screen.dart';
import 'package:grocery_app/Commonwidgets/Customdrawer/custom_drawer.dart';
import 'package:grocery_app/Commonwidgets/Offer_carousal/offer_carousalscreens.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Richtext/rich_text.dart';
import 'package:grocery_app/Commonwidgets/Searchfeild/common_searchbar.dart';
import 'package:grocery_app/Commonwidgets/dummy%20homecard/home_carddummy.dart';
import 'package:grocery_app/Models/dummyitms.dart';
import 'package:grocery_app/Providers/location_provider.dart';
import 'package:grocery_app/Screens/Cardscreens/cards_screen.dart';

import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () =>
          Provider.of<LocationProvider>(context, listen: false).fetchLocation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.blockHeight * 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.18),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 4.5,
                vertical: SizeConfig.blockHeight * .30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 14, 98, 17),
                              ),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/Icons/menu.png',
                              width: SizeConfig.blockWidth * 6,
                              height: SizeConfig.blockHeight * 6,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: SizeConfig.blockHeight * 2.5,
                          ),
                          SizedBox(width: SizeConfig.blockWidth * 2),
                          Consumer<LocationProvider>(
                            builder: (context, locationProvider, child) {
                              return Text(
                                locationProvider.location,
                                style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockHeight * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 14, 98, 17),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromARGB(255, 14, 98, 17),
                            ),
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'assets/Icons/notify.png',
                            width: SizeConfig.blockWidth * 6,
                            height: SizeConfig.blockHeight * 6,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1.5),
                  CommonSearchBar(
                    controller: _searchController,
                    hintText: "Search Categories....",
                    onChanged: (value) {},
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 2,
                      vertical: SizeConfig.blockHeight * 0.2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CommonRichText(
                      fontSize: SizeConfig.blockHeight * 2.5,
                      firstText: 'Delivery within ',
                      secondText: '1 Hr',
                      firstColor: Colors.black,
                      secondColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1),
                  PromoCarouselPage(),
                  SizedBox(height: SizeConfig.blockHeight * 1.5),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockHeight * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CommonRichText(
                                  fontSize: SizeConfig.blockHeight * 2.2,
                                  firstText: 'Shop By Category',
                                  secondText: '',
                                  firstColor: Colors.black,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CommonRichText(
                                  fontSize: SizeConfig.blockHeight * 1.5,
                                  firstWeight: FontWeight.w400,
                                  firstText: 'View all ',
                                  secondText: '>>',
                                  secondColor: Colors.black,
                                  firstColor: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: SizeConfig.blockHeight * 1.5),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ItemCard(
                                  title: 'Fruits',
                                  imagePath: 'assets/Items/fruits.png',
                                  onTap: () {
                                    final items = categoryItems['Fruits'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Fruits',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                ItemCard(
                                  title: 'Vegetables',
                                  imagePath: 'assets/Items/veg.png',
                                  onTap: () {
                                    final items =
                                        categoryItems['Vegetables'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Vegetables',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Dairy',
                                  imagePath: 'assets/Items/dairy.png',
                                  onTap: () {
                                    final items = categoryItems['Dairy'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Dairy',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Bakery',
                                  imagePath: 'assets/Items/bakes.png',
                                  onTap: () {
                                    final items = categoryItems['Bakery'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Bakery',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Grains',
                                  imagePath: 'assets/Items/grains.png',
                                  onTap: () {
                                    final items = categoryItems['Grains'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Grains',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Snacks',
                                  imagePath: 'assets/Items/snacks.png',
                                  onTap: () {
                                    final items = categoryItems['Snacks'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Snacks',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Spices',
                                  imagePath: 'assets/Items/spice.png',
                                  onTap: () {
                                    final items = categoryItems['Spices'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Spices',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ItemCard(
                                  title: 'Beverages',
                                  imagePath: 'assets/Items/beverage.png',
                                  onTap: () {
                                    final items =
                                        categoryItems['Beverages'] ?? [];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomCardScreen2(
                                          title: 'Beverages',
                                          items: items,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: SizeConfig.blockHeight * 1.5),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockHeight * 0.3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CommonRichText(
                                  fontSize: SizeConfig.blockHeight * 2.1,
                                  firstText: 'New Arrival',
                                  secondText: '...',
                                  firstColor: Colors.black,
                                  secondColor: Colors.black,
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight * 1.3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ProductCard(
                                    imageUrl: 'assets/dummyimage/avacado.png',
                                    onAddToCart: () {},
                                    price: ' ₹ 200',
                                    title: 'Avacado',
                                    weight: '1 kg',
                                  ),
                                  ProductCard(
                                    imageUrl:
                                        'assets/dummyimage/strawberry.png',
                                    onAddToCart: () {},
                                    price: ' ₹ 100',
                                    title: 'Strawberry',
                                    weight: '140 g',
                                  ),
                                  ProductCard(
                                    imageUrl:
                                        'assets/carousal_images/cherry.png',
                                    onAddToCart: () {},
                                    price: ' ₹ 95',
                                    title: 'Cherry',
                                    weight: '100 g',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
