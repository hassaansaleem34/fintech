import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/features/loan_screens/contoller/dropdown.dart';
import 'package:flutter/material.dart';

class FillForm extends StatelessWidget {
  const FillForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
        ),
        title: Text("Loan Request Form", style: TextOnStyle.loanAppBarStyle),
        centerTitle: true,
      ),
      body: Center(child: Column(children: [MultiSelectTextField()])),
    );
  }
}
