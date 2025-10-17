import 'package:app_tesing/models/cart_item.dart';
import 'package:app_tesing/models/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "a juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/images.png",
      price: 0.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: "aboutcom__coeus__resourceburger",
      description: "lettuce, tomato, and a hint of onion and pickle...",
      imagePath: "assets/images/burgers/__opt__aboutcom__coeus__resource.png",
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.99),
        Addon(name: "Bacon", price: 3.49),
        Addon(name: "Avocado", price: 5.29),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: "comte-cheesburgers",
      description:
          "A no frills burger joint in the heart of the city of Phnom Penh. We provide you with full bellies, board games for days and banter you will enjoy. Meat, vegetarian and vegan options - something for everyone!",
      imagePath: "assets/images/burgers/crispy-comte-cheesburgers-FT-REC.png",
      price: 1.92,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.92),
        Addon(name: "Bacon", price: 2.44),
        Addon(name: "Avocado", price: 5.89),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: "Beef-Salmon-and-Kebab",
      description:
          "Eleven One Kitchen is an environmentally responsible restaurant committed to serving delicious, high quality, healthy food. The Khmer and western-inspired menu is a combination of much-loved favourites and regularly changing specials that make use of the produce in season. There is plenty of choice for",
      imagePath: "assets/images/burgers/Homemade-Beef-Salmon-and-Kebab-S.png",
      price: 1.5,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.5),
        Addon(name: "Bacon", price: 2.33),
        Addon(name: "Avocado", price: 3.33),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: "mushroom-black-beanburger",
      description: "Vegetarian Friendly, Vegan Options",
      imagePath: "assets/images/burgers/real-simple-mushroom-black-bean.png",
      price: 4.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 4.99),
        Addon(name: "Bacon", price: 6.55),
        Addon(name: "Avocado", price: 8.85),
      ],
      category: FoodCategory.burgers,
    ),
    // salads
    Food(
      name: "superfoodssalad",
      description:
          "Gerbies Salad and Sandwich is Phnom Penh's first quality salad and sandwich shop which aims to provide speedy eat-in and self-takeaway service to those that are on the move or they have limited lunch time at down to earth prices . Our cold salads are carefully prepared by ourselves and are packed in our unique designed boxes. These cold salads boxes can be taken away or eaten in our shop. These boxed salads are 'made today and gone today', so nothing will be kept for the next day. In addition, we also have varieties of warm salads including beef, crispy squid & chorizo, brouillee and Lardon & Mushroom. We also sell deliciously ranges of cold and hot baguette sandwiches and paninis as well as varieties of fresh fruits, juices, smoothies, coffee, etc... We are located in the most popular tourist area of Boeng Keng Kong 1 at No 78, Street 51 ( Pasteur) , Phnom Penh (Opposite Wat Lanka's book stalls). Our boutique shop has 45 seats capacity and is well air-conditioned. Our first floor has a terrace over looking the bustling street of 51 and Sihanouk Boulevard ,next door to Independence Monument. Our staff are well trained and speak good level of English. We hope to serving you soon.",
      imagePath: "assets/images/salads/12superfoodssalad-9.png",
      price: 5.59,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 5.59),
        Addon(name: "Bacon", price: 6.55),
        Addon(name: "Avocado", price: 8.85),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: "chopped-power-salad-with-chicken",
      description:
          "Salad K is a restaurant sells specifically for Salad and fresh juice only with very low price compare to all restaurants where salad and juice are served in Cambodia. Most customers especially foreign customers are satisfied with our restaurant and always asking whether we have tripadviser to rate best grade for us and recommend to other travelers who would like to have salad and fresh juice.",
      imagePath: "assets/images/salads/chopped-power-salad-with-chicken.png",
      price: 1.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.99),
        Addon(name: "Bacon", price: 6.55),
        Addon(name: "Avocado", price: 8.55),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: "Italian Chopped Salad",
      description:
          "This chopped salad is so flavorful that even salad skeptics will pile their plates with seconds! The key ingredients? A punchy dressing, pepperoncini, and TWO types of cheese.",
      imagePath: "assets/images/salads/images.png",
      price: 3.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 3.99),
        Addon(name: "Bacon", price: 6.55),
        Addon(name: "Avocado", price: 8.55),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: "Beet Salad",
      description:
          "This beet, apple, and goat cheese salad would be at home on any holiday table. To get ahead, roast the beets and make the balsamic vinaigrette a day or two in advance.",
      imagePath: "assets/images/salads/imagess.png",
      price: 7.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 7.99),
        Addon(name: "Bacon", price: 10.55),
        Addon(name: "Avocado", price: 11.55),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: "Mediterranean-Chopped-Salad",
      description:
          "It’s complete with crispy tortilla strips, savory plant-based taco “meat,” and a zesty cilantro lime dressing. Healthy lunches don’t get tastier than this.",
      imagePath: "assets/images/salads/Mediterranean-Chopped-Salad-12 (1).png",
      price: 6.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 6.99),
        Addon(name: "Bacon", price: 8.58),
        Addon(name: "Avocado", price: 11.55),
      ],
      category: FoodCategory.salads,
    ),
    // sides
    Food(
      name: "Butter-bath potatoes",
      description:
          "These spuds are worth the fuss. First, they are parboiled, which guarantees fluffy insides. Then they are roasted with just a light coating of oil, which makes them crispy. Finally, a bath of garlicky butter to finish them off. You’ll want to dive right in, too! If you’re looking for new inspiration on classic Christmas sides, butter-bath potatoes are sure to impress your guests. When I’m deciding which side dish I want to pile onto my plate, the crispiness of the potatoes is definitely a contributing factor in my decision. When these gorgeous golden-brown potatoes are on the table, I have to fight against the urge to ignore every other option - including the main!",
      imagePath: "assets/images/sides/images.png",
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.99),
        Addon(name: "Bacon", price: 4.58),
        Addon(name: "Avocado", price: 8.55),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      name: "Garlic and herb butter smashed potatoes",
      description:
          "Take crispy roast potatoes to new heights by covering them in a delicious garlic and herb butter, and parmesan, before baking.",
      imagePath: "assets/images/sides/cowboy-pasta-salad-lead-647dfb86.png",
      price: 3.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 3.99),
        Addon(name: "Bacon", price: 8.58),
        Addon(name: "Avocado", price: 11.55),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      name: "Balsamic roast potatoes",
      description:
          "Toss the potatoes, garlic and eschalot in a bowl with the oil and balsamic vinegar. Season and arrange in a single layer on a baking tray. Scatter with rosemary and roast, turning twice, for 45-50 minutes until crispy, golden and cooked through. Serve warm.",
      imagePath: "assets/images/sides/potato-side-dishes-1675113562.png",
      price: 1.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.99),
        Addon(name: "Bacon", price: 3.58),
        Addon(name: "Avocado", price: 5.55),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      name: "side-dishes-for-ribs",
      description:
          "For a twist on traditional garlic bread, try this gourmet version with olives, sun-dried tomatoes and chives.",
      imagePath: "assets/images/sides/side-dishes-for-ribs-to-serve-20.png",
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.99),
        Addon(name: "Bacon", price: 4.58),
        Addon(name: "Avocado", price: 5.55),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      name: "thanksgiving-sides-hasselback",
      description:
          "They are called the best roast potatoes for good reason. This is a FODMAP friendly recipe for a Low FODMAP diet.",
      imagePath: "assets/images/sides/thanksgiving-sides-hasselback-bu.png",
      price: 6.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 6.99),
        Addon(name: "Bacon", price: 11.58),
        Addon(name: "Avocado", price: 15.55),
      ],
      category: FoodCategory.sides,
    ),
    // desserts
    Food(
      name: "Cherry-Delight-Dessert",
      description:
          "We believe the best kind of brownie recipe is the one that results the fudgy kind of brownies. If you think otherwise, trust us, these chocolate brownies are sure to change your mind. Originally created in the 1800s, the decadent US-born",
      imagePath: "assets/images/desserts/Cherry-Delight-Dessert_EXPS_TOHc.png",
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.99),
        Addon(name: "Bacon", price: 5.55),
        Addon(name: "Avocado", price: 11.55),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Chocolate-sandwich-cupcakes",
      description:
          "Every cook needs a moist banana cake recipe that they keep coming back to, and we think this recipe is the only one you need. Not to be mistaken for banana bread, this recipe proves there's a difference between the two related",
      imagePath: "assets/images/desserts/Chocolate-sandwich-cupcakes-4b30.png",
      price: 1.19,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.19),
        Addon(name: "Bacon", price: 5.55),
        Addon(name: "Avocado", price: 8.85),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      name: "milk-n-cookies-icebox",
      description:
          "What's better than a decadent chocolate mousse recipe? A easy chocolate mousse recipe that's ready in mere minutes. With its timeless elegance, chocolate mousse is always in fashion. From its first appearance in France in the",
      imagePath: "assets/images/desserts/milk-n-cookies-icebox-cake-lead.png",
      price: 2.22,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.22),
        Addon(name: "Bacon", price: 4.55),
        Addon(name: "Avocado", price: 5.55),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      name: "CremeCaramel",
      description:
          "Classic sticky date pudding recipe An ultra-moist, brown sugar cake doused in rich butterscotch sauce, our classic sticky date pudding recipe is what comfort food eating is all about. Is there a more glorious pudding in the world than",
      imagePath:
          "assets/images/desserts/OLI-0918_HereNow-CremeCaramel_28 (1).png",
      price: 5.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 5.99),
        Addon(name: "Bacon", price: 8.55),
        Addon(name: "Avocado", price: 9.55),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      name: "summer-desserts",
      description:
          "Is it odd that one of the greatest cakes in the world is made with a vegetable? Not at all. Carrots have a natural sweetness that becomes more pronounced the longer they cook. This carrot cake recipe presents carrot cake with a swoon-",
      imagePath: "assets/images/desserts/summer-desserts.png",
      price: 1.11,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.11),
        Addon(name: "Bacon", price: 5.11),
        Addon(name: "Avocado", price: 7.55),
      ],
      category: FoodCategory.desserts,
    ),
    // drinks
    Food(
      name: "Blue Drink-Silver Factory",
      description:
          "Cool down with this fresh peach fizz served with mint leaves and juicy raspberries.",
      imagePath: "assets/images/drinks/Blue Drink-Silver Factory-01.png",
      price: 1.21,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.21),
        Addon(name: "Bacon", price: 3.11),
        Addon(name: "Avocado", price: 4.55),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Frozen apple margarita",
      description:
          "To make this frozen drink into a mocktail, swap the tequila for an extra cup of sparkling apple juice.",
      imagePath: "assets/images/drinks/img_66103d62b5dbd_1712340322.png",
      price: 2.21,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.21),
        Addon(name: "Bacon", price: 3.52),
        Addon(name: "Avocado", price: 4.54),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Pink grapefruit party punch",
      description:
          "Go alcohol-free and swap the tequila and Cointreau for 3/4 cup (185ml) mango and orange flavoured mineral water.",
      imagePath: "assets/images/drinks/juicy-orange-and-red-tequila-sun.png",
      price: 1.21,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.21),
        Addon(name: "Bacon", price: 3.81),
        Addon(name: "Avocado", price: 4.45),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Curtis Stone's fresh strawberry water",
      description:
          "Serve a round of Curtis Stone's non-alcoholic summer drink, made with fresh strawberries, lime juice and mint.",
      imagePath: "assets/images/drinks/watermelon-and-gin-slushies-1260.png",
      price: 2.21,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.21),
        Addon(name: "Bacon", price: 3.11),
        Addon(name: "Avocado", price: 4.55),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Basil, strawberry and watermelon cooler",
      description:
          "Everyone will love this pretty-in-pink strawberry and watermelon cocktail.",
      imagePath: "assets/images/drinks/watermelon-sweet-tea-27495_IK_dr.png",
      price: 2.22,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.22),
        Addon(name: "Bacon", price: 3.21),
        Addon(name: "Avocado", price: 4.25),
      ],
      category: FoodCategory.drinks,
    ),
  ];
  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change/update)
  String _deliveryAddress = '99 Hollywood Bly';

  /* 
  G E T T E R S
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P E R A T I O N S
  */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      return isSameFood && isSameAddons;
    });
    //if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise,add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  /*
  H E L P E R S
  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name}-${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("---------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to :$deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}
