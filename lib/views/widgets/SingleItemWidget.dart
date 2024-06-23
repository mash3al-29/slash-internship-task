import 'package:flutter/material.dart';
import 'package:slash/models/SharedModel.dart';
import 'package:slash/views/widgets/inventory.dart';
import 'colors.dart';
import 'fonts.dart';

class SingleItemWidget extends StatefulWidget {
  final String randomIcon;
  final Item item;

  const SingleItemWidget({
    Key? key,
    required this.item,
    required this.randomIcon,
  }) : super(key: key);

  @override
  State<SingleItemWidget> createState() => _SingleItemWidgetState();
}

class _SingleItemWidgetState extends State<SingleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 124.0,
                height: 116.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 6.0,
                left: 92.0,
                child: Container(
                  width: 26.0,
                  height: 26.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                  child: Image.asset(
                    'assets/icons/heart.png',
                    width: 15.0,
                    height: 15.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.item.name,
            style: const TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Text(
                'EGP ${widget.item.price}',
                style: const TextStyle(
                  fontFamily: AppFonts.fontFamily,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 8.0),
              Center(
                child: Image.asset(
                  widget.randomIcon,
                  width: 22.0,
                  height: 22.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 22.0,
                height: 22.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Center(
                  child: Image.asset(
                    Inventory.iconAdd,
                    width: 16.0,
                    height: 16.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
