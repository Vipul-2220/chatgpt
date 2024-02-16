import 'package:chatgpt/services/api_service.dart';
import 'package:flutter/material.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModel = 'Model1';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty ? const SizedBox.shrink() : DropdownButton(items: getMode, onChanged: onChanged)
      },
    );
  }
}
