import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import 'package:united102/features/settingScreens/presentation/widgets/header_setting_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../logic/bloc/theme_bloc/theme_bloc.dart';
import '../widgets/drop_down_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ThemeSettingScreen extends StatefulWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingScreen> createState() => _ThemeSettingScreenState();
}

class _ThemeSettingScreenState extends State<ThemeSettingScreen> {
  final List<String> items = [
    'Темная',
    'Светлая',
  ];
  String? selectedValue;

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ThemeBloc(),
  child: BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {

    return BlocConsumer<ThemeBloc, ThemeState>(
  listener: (context, state) {
    if(state is BlackThemeState){

    }
  },
  builder: (context, state) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        leading: IconButton(onPressed: (){
          context.go('/');
        }, icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)),

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            width: 150,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
            HeaderSettingWidget(title: 'Пожалуйста, выберите \n'
                ' тему'),
              SizedBox(
                height: 20,
              ),
              InkWell(

                child: CustomDropdownButton2(
                  hint: 'Выберите тему',
                  dropdownItems: items,
                  value: selectedValue,

                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                BlocProvider.of<ThemeBloc>(context).add(ChangeBlackTheme());
              }, child: Text('black'))
            ],
          ),
        ),
      ),
    );
  },
);
  },
),
);
  }
}
