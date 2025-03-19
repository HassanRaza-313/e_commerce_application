import 'package:flutter/material.dart';

class CardItem {
  final String title;
  final String pricing;
  final List<String> images;
  int currentIndex;

  CardItem({required this.title,required this.pricing,required this.images,this.currentIndex = 0 ,});
}