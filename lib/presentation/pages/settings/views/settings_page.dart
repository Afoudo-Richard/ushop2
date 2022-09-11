import 'package:easy_localization/easy_localization.dart';
import 'package:ushop/blocs/settings/bloc/settings_bloc.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SettingsPage(),
      settings: const RouteSettings(name: "SettingsPage"),
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
            setState(() {});
          },
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "settings".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(context.locale.languageCode),
              CustomButton(
                onPressed: () {
                  context.setLocale(Locale('fr', 'FR'));
                },
                child: Text(
                    "change local: (current ${context.locale.toString()})"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change language",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return DropdownButton(
                        // Initial Value
                        value: state.locale,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: context.supportedLocales.map((Locale items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items.languageCode),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (Locale? newValue) {
                          BlocProvider.of<SettingsBloc>(context)
                              .add(SettingsLanguageChanged(locale: newValue!));
                          context.setLocale(newValue);
                          //setState(() {});
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
