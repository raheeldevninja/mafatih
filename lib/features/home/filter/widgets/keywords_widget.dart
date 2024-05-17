import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/keyword.dart';
import 'package:mafatih/features/home/filter/widgets/keyword_tile.dart';

class KeywordsWidget extends StatefulWidget {
  const KeywordsWidget({super.key});

  @override
  State<KeywordsWidget> createState() => _KeywordsWidgetState();
}

class _KeywordsWidgetState extends State<KeywordsWidget> {
  List<Keyword> keywordsList = [];
  final _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.keywordsLabel,
          style: context.textTheme.bodyLarge,
        ),

        const SizedBox(height: 8),

        ///keyword text field
        TextField(
          controller: _keywordController,
          onSubmitted: (value) {
            //add keyword to list
            keywordsList.add(Keyword(
                id: '${keywordsList.length + 1}',
                value: _keywordController.text));
            _keywordController.clear();

            setState(() {});
          },
          decoration: InputDecoration(
            hintText: l10n.keywordsHint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: IconButton(
              onPressed: () {
                //add keyword to list
                keywordsList.add(Keyword(
                    id: '${keywordsList.length + 1}',
                    value: _keywordController.text));
                _keywordController.clear();

                setState(() {});
              },
              icon: const Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        const SizedBox(height: 20),

        ///horizontal keywords listview width cross
        keywordsList.isEmpty
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: keywordsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return KeywordTile(
                          value: keywordsList[index].value,
                          onTap: () {
                            //remove
                            keywordsList.removeAt(index);
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();

    _keywordController.dispose();
  }
}
