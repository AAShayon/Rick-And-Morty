import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:ricky_monty/Modules/character/viewModel/character_view_model.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/utils/styles.dart';
import 'package:ricky_monty/viewModel/landing_view_model.dart';

class SearchCharacter extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final characterProvider = Provider.of<CharacterViewModel>(context);

    Widget circleLoading() {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.baseColorWhite,),
      );
    }

    if (query.isEmpty) {
      return circleLoading();
    }

    return FutureBuilder(
      future: characterProvider.getSearchCharacter(context,query),
      builder: (context, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) {
          return circleLoading();
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final character = snapshot.data![index];
            return ListTile(
              onTap: () {
                final landingViewModel=Provider.of<LandingViewModel>(context,listen: false);
                landingViewModel.selectCharacter(character);
                close(context, null);
              },
              title: Text(character.name!,style: TextStyles.caption1Strong(AppColors.baseColorWhite),),
              leading: Hero(
                  tag: character.id!,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(character.image!),
                  )),
            );
          },
        );
      },
    );
  }
}
