import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({super.key});

  @override
  State<FullScreenPage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  late final String imageUrl;

  @override
  void didChangeDependencies() {
    imageUrl = ModalRoute.of(context)?.settings.arguments.toString() as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SelectableText(
              imageUrl,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: InteractiveViewer(
                clipBehavior: Clip.none,
                child: Hero(tag: imageUrl, child: CachedNetworkImage(imageUrl: imageUrl)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
