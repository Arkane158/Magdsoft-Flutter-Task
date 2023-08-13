import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/ui/home/home_viewmodel.dart';
import 'package:magdsoftfluttertask/model/ui/home/product_item.dart';
import 'package:magdsoftfluttertask/model/ui/itemview/item_view_screen.dart';
import 'package:magdsoftfluttertask/model/ui/login/login_screen.dart';
import 'package:magdsoftfluttertask/model/ui/settings/settings_screen.dart';
import '../custom_widgets/custom_colorgrid_container.dart';
import '../custom_widgets/custom_crouse_container.dart';
import '../custom_widgets/custom_form_field.dart';
import 'brands_listview.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CustomColorGridContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .05,
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: CustomFormField(
                              hintText: 'Search',
                              suffixIcon: Icon(
                                Icons.search,
                              ),
                            ),
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.filter_alt),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .18,
                        child: CarouselSlider(
                          items: [
                            Stack(
                              children: [
                                const CustomCrouseContainer(
                                    imagePath: 'assets/images/carsour1.png'),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 5),
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'New Release\nAcer Predator Helios 300',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const CustomCrouseContainer(
                                imagePath: 'assets/images/carsour2.png')
                          ],
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * .3,
                            enlargeCenterPage: true,
                            autoPlay: true, // Set to true for auto play.
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 500),
                            viewportFraction:
                                1.0, // One image occupies full width.
                          ),
                        ),
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: BrandsListView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(child:
                  BlocBuilder<HomeViewModel, HomeState>(
                      builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is SucessState) {
                  return StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2, // Two products in each row
                    crossAxisSpacing:
                        15.0, // Adjust the spacing between columns
                    mainAxisSpacing: 1.0, // Adjust the spacing between rows
                    staggeredTileBuilder: (index) {
                      return index % 2 == 0
                          ? const StaggeredTile.fit(1)
                          : const StaggeredTile.fit(1);
                    },
                    itemCount:
                        state.products.length + 1, // +1 for the text widget
                    itemBuilder: (context, index) {
                      // Show the text widget at index 0 (first item in the grid)
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Recomended for You",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              )),
                        );
                      }

                      // Subtract 1 from index to adjust for the added text widget
                      final productIndex = index - 1;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ItemViewScreen.screenName,
                                arguments: state.products[productIndex]);
                          },
                          child: ProductItem(
                            product: state.products[productIndex],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Text('');
                // return widget here based on BlocA's state
              })),
            )
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            color: Colors.white,
            elevation: 5,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  .08, // Adjust the height to your desired value
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center, // Add this line
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xffB1B1B1),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.screenName);
                    },
                  ),
                  IconButton(
                    color: const Color(0xffB1B1B1),
                    icon: const Icon(
                      Icons.favorite,
                    ),
                    onPressed: () {
                      // Handle favourite action
                    },
                  ),
                  IconButton(
                    color: const Color(0xffB1B1B1),
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications action
                    },
                  ),
                  IconButton(
                    color: const Color(0xffB1B1B1),
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // Handle settings action
                      Navigator.pushNamed(context, SettingsScreen.screenName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Stack(
          children: [
            FloatingActionButton(
              heroTag: 'home',
              onPressed: () {},
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // Set the background color to a gradient
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 98, 189, 1),
                      Color.fromRGBO(0, 98, 189, 0.72),
                      Color.fromRGBO(0, 98, 189, .4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  child: const Icon(Icons.home, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
