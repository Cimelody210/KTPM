import 'package:flutter/material.dart';

class phimdangchieu extends StatelessWidget {
  const phimdangchieu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200, width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.cyan,
              height: 200,
              width: 155 ,
            ),
          ),
        );
      }
    ),
  );
  }
}
