import 'package:fintech/core/widgets/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Transactions")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TransactionCard(
              title: "Loan Repayment",
              time: "10:30pm",
              amount: "- ₦ 1,800,400",
              amountColor: Colors.red,
              iconBg: Color(0xffEAF1FF),
              icon: Image.asset("assets/images/icons/Mask group.png"),
            ),
            TransactionCard(
              title: "Wallet Top Up",
              time: "5:45pm",
              amount: "+ ₦ 2,500",
              amountColor: Colors.green,
              iconBg: Color(0xffEEF6FF),
              icon: SvgPicture.asset("assets/images/icons/plus.svg", height: 22),
            ),
            TransactionCard(
              title: "Victor Isaac",
              time: "10:45pm",
              amount: "+ ₦ 800,000",
              amountColor: Color(0xff5AD78B),
              iconBg: Color(0xffFFF1E8),
              icon: SvgPicture.asset("assets/images/icons/VI.svg", height: 22),
            ),
            TransactionCard(
              title: "DSTV Subscription",
              time: "10:30pm",
              amount: "- ₦ 1,800,400",
              amountColor: Color(0xff7C18FB),
              iconBg: Color(0xffEAF1FF),
              icon: Image.asset("assets/images/logo/Ellipse 37.png"),
            ),
            TransactionCard(
              title: "Wisdom Olatayo",
              time: "5:45pm",
              amount: "+ ₦ 2,500",
              amountColor: Color(0xffF59300),
              iconBg: Color(0xffEEF6FF),
              icon: SvgPicture.asset("assets/images/icons/WO.svg", height: 20),
            ),
            TransactionCard(
              title: "Victor Isaac",
              time: "10:45pm",
              amount: "+ ₦ 800,000",
              amountColor: Color(0xff5AD78B),
              iconBg: Color(0xffFFF1E8),
              icon: SvgPicture.asset("assets/images/icons/VI.svg", height: 20),
            ),
            TransactionCard(
              title: "Eko Electrical",
              time: "10:45pm",
              amount: "- ₦ 800,000",
              amountColor: Color(0xffF81111),
              iconBg: Color(0xffFFF1E8),
              icon: Image.asset("assets/images/logo/Ellipse 37 (1).png"),
            ),
          ],
        ),
      ),
    );
  }
}
