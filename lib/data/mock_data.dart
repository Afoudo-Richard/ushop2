import 'package:line_icons/line_icons.dart';
import 'package:ushop/data/models/models.dart';

List<User> listOfUsers = [
  User(
    id: 1,
    first_name: "Yelena",
    last_name: "Belova",
    email: "yelena@gmail.com",
    phone: "+211 78901234",
    photo:
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
    name: "Yelena Belova",
  ),
];

List<Category> listOfCategory = [
  Category(
    id: 1,
    name: "Food",
    icon: LineIcons.folder,
  ),
  Category(
    id: 2,
    name: "Phone",
    icon: LineIcons.phone,
  ),
  Category(
    id: 3,
    name: "Television",
    icon: LineIcons.television,
  ),
  Category(
    id: 4,
    name: "Perfurms",
    icon: LineIcons.sprayCan,
  ),
  Category(
    id: 5,
    name: "Shoes",
    icon: LineIcons.shoePrints,
  ),
  Category(
    id: 6,
    name: "Flowers",
    icon: LineIcons.faceBlowingAKiss,
  ),
  Category(
    id: 7,
    name: "Books",
    icon: LineIcons.book,
  ),
];

List<News> news_list = [
  News(
    title: "Philosophy That Addresses Topics Such As Goodness",
    imageThumbnail:
        "https://images.unsplash.com/photo-1657299170222-1c67dc056b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    content:
        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
    date_published: "13, Jan 2021",
  ),
  News(
    title: "Did you know",
    imageThumbnail:
        "https://images.unsplash.com/photo-1660895636370-7b696ec3c1cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
    content:
        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
    date_published: "14, Jan 2021",
  ),
  News(
    title:
        "Many Inquiries Outside Of Academia Are Philosophical In The Broad SenseUshop.",
    imageThumbnail:
        "https://images.unsplash.com/photo-1660873056483-7aac15eb7c86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=740&q=80",
    content:
        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
    date_published: "16, Jan 2021",
  ),
  News(
    title: "How to sell faster on Ushop.",
    imageThumbnail:
        "https://images.unsplash.com/photo-1660860551412-a93c5026b034?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    content:
        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
    date_published: "19, Jan 2021",
  ),
  News(
    title: "Primary tips to be a better seller.",
    imageThumbnail:
        "https://images.unsplash.com/photo-1660915688465-1193a8d044b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    content:
        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
    date_published: "20, Jan 2021",
  ),
];

// Sellers
List<Seller> listOfSellers = [
  Seller(
    shop_logo_image:
        "https://images.unsplash.com/photo-1590874315261-788881621f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
    name: "Shop Larson Electronic",
    isApproved: true,
    location: "South Africa, Cape Town",
    followers: 23,
    products: [
      Product(
        id: 1,
        image:
            "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        name: "Polaroid Camera (I-Type Camera)",
        price: "18000",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 4.2,
        total_reviews: 86,
        total_available: 250,
        isLiked: true,
      ),
      Product(
        id: 2,
        image:
            "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        name: "NIKE FREE",
        price: "500",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 3.9,
        total_reviews: 86,
        total_available: 8,
        isLiked: false,
      ),
      Product(
        id: 3,
        image:
            "https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
        name: "Apple Watch 3",
        price: "250",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 2.2,
        total_reviews: 6,
        total_available: 67,
        isLiked: false,
      ),
      Product(
        id: 4,
        image:
            "https://images.unsplash.com/photo-1541643600914-78b084683601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=704&q=80",
        name: "Chanel N-5",
        price: "100",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 2.2,
        total_reviews: 10,
        total_available: 1,
        isLiked: false,
      ),
      Product(
        id: 5,
        image:
            "https://images.unsplash.com/photo-1571782742478-0816a4773a10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=701&q=80",
        name: "Curology (The cleanser)",
        price: "50",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 0.2,
        total_reviews: 10,
        total_available: 40,
        isLiked: true,
      ),
      Product(
        id: 6,
        image:
            "https://images.unsplash.com/photo-1522273400909-fd1a8f77637e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80",
        name: "Apple collection",
        price: "1000",
        description:
            "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
        avg_rating: 0.2,
        total_reviews: 30,
        total_available: 5,
        isLiked: true,
      ),
    ],
    date_joined: "20, Oct 2021",
  ),
];

// List of products

List<Product> listOfProducts = [
  ...listOfSellers[0].products,
];

List<Review> listOfReviews = [
  Review(
    user: listOfUsers[0],
    review: "Thanks for the product",
    rating: 3.5,
    date_posted: "2 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review: "Please does this product come with a user guide.",
    rating: 4.5,
    date_posted: "5 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review:
        "Bad product. After buying this I could not use it for 5 days for some reason I don't know.",
    rating: 1.5,
    date_posted: "10 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review: "Yes nice product.",
    rating: 3.5,
    date_posted: "15 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review: "Thanks for the product",
    rating: 2.5,
    date_posted: "15 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review: "Do you have other products or versions related to this product?",
    rating: 5,
    date_posted: "20 January, 2022",
  ),
  Review(
    user: listOfUsers[0],
    review: "Thanks for the product",
    rating: 3.5,
    date_posted: "21 January, 2022",
  ),
];
