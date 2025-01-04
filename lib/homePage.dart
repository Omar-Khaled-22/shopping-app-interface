import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  changeLang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: changeLang, icon: Icon(Icons.language))
        ],
        title: Text(tr("Home")),
      ),
      body: SingleChildScrollView(
        //to make the page scrollable
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(tr("Our Products")),
            Center(
              // container that has page view which contains an image
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: PageView(
                  children: [
                    Image.network(
                        "https://fastly.picsum.photos/id/9/5000/3269.jpg?hmac=cZKbaLeduq7rNB8X-bigYO8bvPIWtT-mh8GRXtU3vPc")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(tr("Recently Purchased")),
            //recently purchased section (Gridview with tw items in a row)
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 10.0, // Space between items horizontally
                    mainAxisSpacing: 10.0, // Space between items vertically
                  ),
                  itemCount: 4, // Total number of items
                  itemBuilder: (context, index) {
                    return Column(
                      //contain an image under it arow for the title and an icon button
                      children: [
                        Image.network(
                            "https://fastly.picsum.photos/id/20/3670/2462.jpg?hmac=CmQ0ln-k5ZqkdtLvVO23LjVAEabZQx2wOaT4pyeG10I"),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("data"),
                              Center(
                                child: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("item added to the cart"),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.add_box),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),

            Text(tr("Hot Offers")),
            // hot offers section which contains a horizontal listview
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                itemBuilder: (context, index) => Container(
                  width: 200, // Set a fixed width for each item
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network(
                          "https://fastly.picsum.photos/id/9/5000/3269.jpg?hmac=cZKbaLeduq7rNB8X-bigYO8bvPIWtT-mh8GRXtU3vPc"),
                      const Text("data"),
                    ],
                  ),
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
