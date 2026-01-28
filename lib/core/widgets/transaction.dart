import 'package:flutter/material.dart';


class TransactionCard extends StatelessWidget {
  final String title;
  final String time;
  final String amount;
  final Color amountColor;
  final Widget icon;
  final Color iconBg;

  const TransactionCard({
    super.key,
    required this.title,
    required this.time,
    required this.amount,
    required this.amountColor,
    required this.icon,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🔵 Left Circle Icon
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Center(child: icon),
          ),

          const SizedBox(width: 12),

          // 📝 Title + Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1F1F1F),
                  fontFamily: "inter",
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9E9E9E),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const Spacer(),

          // 💰 Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: amountColor,
              fontFamily: "inter",
            ),
          ),
        ],
      ),
    );
  }
}
