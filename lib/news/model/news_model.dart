import 'package:flutter/material.dart';

class Articles {
  final String publishedAt;
  final String title;
  final String urlToImage;

  Articles({
    required this.publishedAt,
    required this.urlToImage,
    required this.title,
  });
}