import 'package:flutter/material.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';

class DetailCustomer extends StatelessWidget {
  final String title;
  final GetCardHolderResponse object;

  DetailCustomer({
    super.key,
    required this.title,
    required GetCardHolderResponse? object,
  }) : object = object ?? emptyCardHolder_ReS; // Gán giá trị mặc định
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate(title),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: defaultPadding),
            ObjectDetailInfor(object: object),
          ],
        ),
      ),
    );
  }
}

class ObjectDetailInfor extends StatelessWidget {
  final GetCardHolderResponse object;

  const ObjectDetailInfor({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    final fields = {
      'ID': object.id.toString(),
      'Branch': object.branch,
      'Short Name': object.shortName,
      'First Name': object.firstName,
      'Last Name': object.lastName,
      'Gender': object.gender,
      'Client Number': object.clientNumber,
      'Reg Number': object.regNumber,
      'ITN': object.itn,
      'Social Number': object.socialNumber,
      'Phone': object.phone,
      'Email': object.email,
    };

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fields.entries.map((entry) => _buildInfoRow(context, entry.key, entry.value)).toList(),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
        ],
      ),
    );
  }
}
