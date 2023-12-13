import 'package:cafe_2/Beverage/beverage_details.dart';
import 'package:cafe_2/Beverage/search_history.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BeverageListing());
}

class BeverageListing extends StatelessWidget {
  const BeverageListing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beverage Listing',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BeverageListScreen(),
    );
  }
}

class BeverageListScreen extends StatefulWidget {
  @override
  _BeverageListScreenState createState() => _BeverageListScreenState();
}

class _BeverageListScreenState extends State<BeverageListScreen> {
  final List<Beverage> beverages = [
    Beverage('Hot Coffee Latte', 'RM8.50', 'One of the best beverage, Hot Coffee', 'assets/hot_coffee_latte.png', true),
    Beverage('Mocha Iced Coffee', 'Rm9.20', 'One of the best beverage, Ice Coffee', 'assets/mocha_iced_coffee.jpg', true),
    Beverage('Java Chip Frappuccino', 'RM14.30', 'One of the best beverage, Frappe', 'assets/java_chip_frappucino.jpg', false),
    Beverage('Strawberry Smoothies', 'RM11.20', 'One of the best beverage, Smoothies', 'assets/strawberry_smoothie.jpg', true),
    Beverage('Red Velvet Cake', '7.50', 'One of the best pastry, Cake', 'assets/red_velvet_cake.jpg', false),
    Beverage('Croissant French Toast', '8.30', 'One of the best pastry, Bread', 'assets/croissant_french_toast.jpg', false),
  ];

  int qty=1;
  List<int> _cart = [];

  void _addToCart() {
    setState(() {
      _cart.add(qty);
    });
  }

  List categories = [
    "HOT COFFEE",
    "ICE COFFEE",
    "COFFEE BLENDED",
    "SMOOTHIES",
    "CAKE",
    "BREAD",
  ];

  List imgBvg = [
    "https://insanelygoodrecipes.com/wp-content/uploads/2020/07/Cup-Of-Creamy-Coffee.png",
    "https://images.immediate.co.uk/production/volatile/sites/30/2022/04/Iced-Caramel-Macchiato-f4a10f9.jpg?quality=90&resize=556,505",
    "https://www.lifeloveandsugar.com/wp-content/uploads/2015/08/Caramel_Blended_Coffee3.jpg",
    "https://www.evolvingtable.com/wp-content/uploads/2022/12/How-to-Make-Smoothie-1.jpg",
    "https://sallysbakingaddiction.com/wp-content/uploads/2013/04/triple-chocolate-cake-4.jpg",
    "https://therecipecritic.com/wp-content/uploads/2022/09/crossaints-2.jpg",
  ];

  List<Beverage> filteredBeverages = [];
  List<Beverage> searchHistory = [];

  @override
  void initState() {
    super.initState();
    filteredBeverages = List.from(beverages);
    //searchHistory = List.from(searchHistory);
  }

  void filterBeverages(String query) {
    setState(() {
      filteredBeverages = beverages
          .where((beverage) =>
      beverage.name.toLowerCase().contains(query.toLowerCase()) ||
          beverage.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      //update search history based on the user's query
    });
  }

  void addToSearchHistory(Beverage beverage) {
    setState(() {
      searchHistory.add(beverage);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Beverage Listing'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BeverageSearchDelegate(beverages, addToSearchHistory),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            tooltip: 'Add to cart',
            onPressed: _addToCart,
          ),
          Text(
            '$qty',
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'Categories',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //       fontFamily: 'Roboto',
            //     ),
            //   ),
            //   children: [
            //     TextFormField(
            //       decoration: const InputDecoration(hintText: "Search ..."),
            //     ),
            //   ],
            // ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                //height: height,
                width: width,
                padding: EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,

                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imgBvg.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      // onTap: (){
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => BeverageDetailsPage(),
                      //     ),
                      //   );
                      // },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(imgBvg[index],
                              //Image.asset(imgBvg[index],
                              width: 100,
                            ),
                            Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0,),
            // SearchHistory(
            //   searchHistory: searchHistory,
            // ),
          ],
        ),
      ),
    );
  }
}

class Beverage {
  final String name;
  final String price;
  final String description;
  final String imageUrl;
  bool isAvailable;

  Beverage(this.name, this.price, this.description, this.imageUrl, this.isAvailable);
}

class BeverageListItem extends StatelessWidget {
  final Beverage beverage;

  const BeverageListItem({Key? key, required this.beverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeverageDetailsPage(
              name: beverage.name,
              price: beverage.price,
              description: beverage.description,
              imageUrl: beverage.imageUrl,
              isAvailable: beverage.isAvailable,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 150.0, // Adjust the width based on your preference
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                beverage.imageUrl,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      beverage.name,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${beverage.price}',
                      style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      beverage.isAvailable ? 'Available' : 'Out of stock',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: beverage.isAvailable ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BeverageDetailsScreen extends StatelessWidget {
  final Beverage beverage;

  const BeverageDetailsScreen({Key? key, required this.beverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beverage Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              beverage.imageUrl,
              width: 200.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              beverage.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'by ${beverage.price}',
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle beverage ordering logic
                // For example, show a confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Order Confirmation'),
                    content: Text('Do you want to order ${beverage.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Perform beverage ordering logic here
                          Navigator.pop(context); // Close the dialog
                          // Optionally show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Beverage ordered successfully!'),
                            ),
                          );
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Order Beverage'),
            ),
          ],
        ),
      ),
    );
  }
}

class BeverageSearchDelegate extends SearchDelegate<String> {
  final List<Beverage> beverages;
  final Function(Beverage) addToSearchHistory;

  BeverageSearchDelegate(this.beverages, this.addToSearchHistory);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? beverages
        : beverages
        .where((beverage) =>
    beverage.name.toLowerCase().contains(query.toLowerCase()) ||
        beverage.price.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            // Add the selected beverage to the search history
            addToSearchHistory(suggestionList[index]);

            // You can navigate to the beverage details screen or handle the selection as needed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeverageDetailsPage(
                  name: suggestionList[index].name,
                  price: suggestionList[index].price,
                  description: suggestionList[index].description,
                  imageUrl: suggestionList[index].imageUrl,
                  isAvailable: suggestionList[index].isAvailable,
                  // Pass more details as needed
                ),
              ),
            );
          },
        );
      },
    );
  }
}