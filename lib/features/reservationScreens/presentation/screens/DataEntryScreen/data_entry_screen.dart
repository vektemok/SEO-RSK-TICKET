import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:united102/iternal/helpers/style_helper.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';

import '../../../../../app/routes/routes.dart';
import '../../../../../iternal/getIt/getIt.dart';
import '../../../../widgets/custom_flushbar.dart';
import '../../../../widgets/screen_switcher_button.dart';
import '../logic/bloc/data_entry_bloc.dart';

class DataEntryScreen extends StatelessWidget {
  DataEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => DataEntryViewModel(),
        child: DataEntrySTF(),
      );
}

class DataEntrySTF extends StatefulWidget {
  const DataEntrySTF({super.key});

  @override
  State<DataEntrySTF> createState() => _DataEntrySTFState();
}

class _DataEntrySTFState extends State<DataEntrySTF> {
  ValueNotifier<bool> enabledButton = ValueNotifier<bool>(false);
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController patronymicController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController pasportController = TextEditingController();

  late DataEntryBloc bloc;

  @override
  void initState() {
    bloc = getIt<DataEntryBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DataEntryViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTextWidget(title: viewModel.headerText),
                  SizedBox(
                    height: 20.h,
                  ),
                  HeaderInputText(headerInputText: viewModel.headerTextList[0]),
                  CustomTextField(
                    controller: surnameController.text,
                  ),
                  HeaderInputText(headerInputText: viewModel.headerTextList[1]),
                  CustomTextField(
                    controller: nameController.text,
                  ),
                  HeaderInputText(headerInputText: viewModel.headerTextList[2]),
                  CustomTextField(
                    controller: patronymicController.text,
                  ),
                  HeaderInputText(headerInputText: viewModel.headerTextList[3]),
                  CustomTextField(
                    controller: dateOfBirthController.text,
                  ),
                  HeaderInputText(headerInputText: viewModel.headerTextList[4]),
                  CustomTextField(
                    controller: pasportController.text,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const TooltipWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  MultiBlocListener(
                    listeners: [
                      BlocListener<DataEntryBloc, DataEntryState>(
                          bloc: bloc,
                          listener: (context, state) {
                            if (state is DataEntryLoadingState) {
                              SmartDialog.showLoading(msg: 'Загрузка...');
                            }

                            if (state is DataEntryLoadeddState) {
                              SmartDialog.dismiss();

                              bloc.add(DateTextFields(
                                  dateOfBirth: dateOfBirthController.text,
                                  name: '',
                                  pasport: '',
                                  patronymic: '',
                                  surname: ''));
                            }

                            if (state is DataEntryFailedState) {
                              SmartDialog.dismiss();

                              Exceptions.showFlushbar(
                                state.error.message.toString(),
                                context: context,
                              );
                            }
                          }),
                    ],
                    child: ValueListenableBuilder<bool>(
                      valueListenable: enabledButton,
                      builder:
                          (BuildContext context, bool value, Widget? child) =>
                              ScreenSwitcherButton(
                        onPressed: () {
                          bloc.add(DateTextFields(
                              surname: surnameController.text,
                              name: nameController.text,
                              patronymic: patronymicController.text,
                              dateOfBirth: dateOfBirthController.text,
                              pasport: pasportController.text));
                        },
                        path: Routes.ticketBookingSuccessScreen,
                        text: 'Далее',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String controller;
  const CustomTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        controller: TextEditingController(text: controller),
        decoration: InputDecoration(
            isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
      ),
    );
  }
}

class HeaderInputText extends StatelessWidget {
  final String headerInputText;

  const HeaderInputText({Key? key, required this.headerInputText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        headerInputText,
        style: descriptionTextStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Мы гарантируем конфиденциальность и безопасность ваших личных данных. Заполнение этих сведений поможет нам обеспечить более эффективное и индивидуальное обслуживание. Благодарим вас за ваше сотрудничество! ',
      style: tooltipTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class DataEntryViewModel extends ChangeNotifier {
  final String _headerText = 'Пожалуйста, укажите \n'
      'следующие данные';

  List<String> _headerTextList = [
    'Фамилия:',
    'Имя:',
    'Отчество:',
    'Номер телефона:',
    'ID пасспорт:',
  ];

  List<String> get headerTextList => _headerTextList;
  String get headerText => _headerText;
}
