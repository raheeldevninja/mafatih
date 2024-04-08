import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/my_account/complains/model/complain.dart';
import 'package:mafatih/features/my_account/complains/widgets/complain_item.dart';


class ComplainsScreen extends StatefulWidget {
  const ComplainsScreen({super.key});

  @override
  State<ComplainsScreen> createState() => _ComplainsScreenState();
}

class _ComplainsScreenState extends State<ComplainsScreen> {
  List<Complain> complains = [];

  @override
  void initState() {
    super.initState();

    _initComplainsList();
  }

  _initComplainsList() {
    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        title: const Text('Complains'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(
              height: 20,
              content: SizedBox(),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: complains.length,
              itemBuilder: (context, index) {
                return ComplainItem(complain: complains[index]);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

