import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:flutter/material.dart';

class MainLoan extends StatelessWidget {
  const MainLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Loan History", style: TextOnStyle.loanAppBarStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Top right button
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.loanRequest);
                },
                child: Container(
                  height: 38,
                  width: 124,
                  decoration: BoxDecoration(
                    color: Color(0xffF56C2A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Request Loan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Center text
            Expanded(
              child: Center(child: Text("Nothing to see here for now!")),
            ),
          ],
        ),
      ),
    );
  }
}
