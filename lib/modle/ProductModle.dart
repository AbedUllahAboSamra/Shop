import 'dart:ffi';

class ProductModle {
   final int id ;
   final String title ;
   final String description ;
   final double price ;
   final double discountPercentage ;
   final double stock ;
   final String brand ;
   final String category ;
   final String thumbnail ;

   ProductModle({
     required this.id,
     required this.title,
     required this.description,
     required this.price,
     required this.discountPercentage,
     required this.stock,
     required this.brand,
     required this.category,
     required this.thumbnail,
    });

}
