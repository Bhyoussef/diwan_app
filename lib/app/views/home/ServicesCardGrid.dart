import 'package:diwanapp/app/views/home/homeServices.dart';
import 'package:flutter/material.dart';

class ServicesCardGrid extends StatelessWidget {
  const ServicesCardGrid({Key? key, required this.homeServices})
      : super(key: key);
  final List<HomeService> homeServices;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final service = homeServices[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(service.namedRoute);
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      service.picPath,
                      width: 40,
                      height: 38,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      service.title,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: homeServices.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          childAspectRatio: 1.0,
        ),
      ),
    );
  }
}
