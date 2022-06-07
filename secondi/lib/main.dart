import 'package:flutter/material.dart';

void main() {
  runApp(const Secondi());
}

class Secondi extends StatelessWidget {
  const Secondi({Key? key}) : super(key: key);

  static const String _title = 'Secondi';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Background Image */
      body: Image.asset('images/selectBG.jpg'),

      /* Transparent AppBar */
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        /* Back Button */
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),

        /* Upper-Right Action Button */
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_rounded),
            onPressed: () {},
          )
        ],
      ),

      /* Bottom Rounded-Box */
      bottomSheet: productDetail('Jean Jackets', 'Pomelo', 300,
          ['red', 'green', 'blue'], ['S', 'M', 'L', 'XL'], 20),
    );
  }

  Container productDetail(name, brand, price, colors, sizes, quantity) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -10),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),

      /* Text */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* Product Name */
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /* Product Brand */
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              brand,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /* Star Rating */
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {},
                ),
                // IconButton(
                //   icon: Icon(Icons.star_border),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),

          /* Drop Down Menu button to select color on the left. Drop down menu button to select size on the right. Same row */
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: colors[0],
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: const Color(0xFFC3D162),
                  ),
                  onChanged: (newValue) {},
                  items: colors.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: sizes[0],
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: const Color(0xFFC3D162),
                  ),
                  // set new display value to user selected choice
                  onChanged: (newValue) {
                  },
                  items: sizes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          /* Drop down menu in the center to select quantity */
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: '1',
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: const Color(0xFFC3D162),
                  ),
                  onChanged: (newValue) {},
                  items: List.generate(quantity, (index) {
                    return DropdownMenuItem<String>(
                      value: (index + 1).toString(),
                      child: Text((index + 1).toString()),
                    );
                  }),
                ),
              ],
            ),
          ),

          /* Add to Bag Button */
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'Add to Bag',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
