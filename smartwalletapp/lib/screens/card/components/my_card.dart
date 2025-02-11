
import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../../dashboard/components/card_info.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context).translate("My Card"),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary,),
              label: Text(AppLocalizations.of(context).translate("Add"), 
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              
            ),
            )
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: InfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1, cardInfo: MyCards,
          ),
          tablet: InfoCardGridView(cardInfo: MyCards,),
          desktop: InfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4, cardInfo: MyCards,
          ),
        ),
      ],
    );
  }
}

class InfoCardGridView extends StatelessWidget {

  final List<dynamic> cardInfo; 

  const InfoCardGridView({
    required this.cardInfo,
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cardInfo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => InforOfCard(info: cardInfo[index]),
    );
  }
}
