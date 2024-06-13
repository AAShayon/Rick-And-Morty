import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/viewModel/landing_view_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final String characterName;

  CharacterDetailScreen({required this.characterName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColorBlack,
      appBar: AppBar(
        backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.baseColorWhite,),
          onPressed: () {
            final landingViewModel=Provider.of<LandingViewModel>(context,listen: false);
            landingViewModel.goBackToPreviousIndex();
            // landingViewModel.deselectCharacter();
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          Center(child: Image.asset('assets/logo/applogo.png', fit: BoxFit.fill,))
        ],
      ),
      body: Center(
        child: Text(
          'Details about $characterName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}