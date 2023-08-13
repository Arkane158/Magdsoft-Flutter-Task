import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/ui/custom_widgets/custom_colorgrid_container.dart';
import 'package:magdsoftfluttertask/model/ui/custom_widgets/custom_elevated_button.dart';
import 'package:magdsoftfluttertask/model/ui/home/home_screen.dart';
import 'package:magdsoftfluttertask/model/ui/settings/expandable_container.dart';
import 'package:magdsoftfluttertask/model/ui/settings/settings_viewmodel.dart';

class SettingsScreen extends StatefulWidget {
  static const String screenName = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsViewModel viewModel = SettingsViewModel();

  @override
  void initState() {
    super.initState();

    // Use Future.delayed to execute the loadHelpData after the current build is complete
    Future.delayed(Duration.zero, () {
      viewModel.getHelp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomColorGridContainer(
                child: Center(
                  child: SingleChildScrollView(
                    child: BlocBuilder<SettingsViewModel, SettingsState>(
                        builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else if (state is SuccessState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            .06,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'Help',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                      ),
                                      // Use the help data to build the ExpandableContainers
                                      if (state.help != null)
                                        for (var helpItem in state.help!)
                                          ExpandableContainer(
                                            title: helpItem.question ?? '',
                                            content: helpItem.answer ?? '',
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1),
              child: CustomElevatedButton(
                radius: 50,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, HomeScreen.screenName);
                },
                label: 'Continue',
              ),
            )
          ],
        ),
      ),
    );
  }
}
