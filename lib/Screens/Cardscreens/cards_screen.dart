import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Searchfeild/common_searchbar.dart';
import 'package:grocery_app/Models/item_model.dart';
import 'package:grocery_app/Screens/Cardscreens/Itemcard/items_cardscreen.dart';

class CustomCardScreen2 extends StatefulWidget {
  final String title;
  final List<Item> items;

  const CustomCardScreen2({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  State<CustomCardScreen2> createState() => _CustomCardScreen2State();
}

class _CustomCardScreen2State extends State<CustomCardScreen2> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.items.where((item) {
      final query = searchController.text.toLowerCase();
      final title = (item.title ?? '').toLowerCase();
      return title.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: SizeConfig.blockHeight * 10,
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: SizeConfig.blockHeight * 2.6,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.blockHeight * 7),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            child: CommonSearchBar(
              controller: searchController,
              hintText: 'Search ${widget.title}',
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 2),

              if (filteredItems.isEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.blockHeight * 10),
                    child: Text(
                      "No items found",
                      style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockHeight * 2.2,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.8,
                    mainAxisExtent: SizeConfig.blockHeight * 22,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return CustomCard(
                      onAddToCart: () {},
                      price: item.price,
                      title: item.title,
                      imagePath: item.imagePath,
                      description: item.description,
                      weight: item.weight,
                    );
                  },
                ),

              SizedBox(height: SizeConfig.blockHeight * 1),
            ],
          ),
        ),
      ),
    );
  }
}
