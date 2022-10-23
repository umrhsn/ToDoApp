import 'package:flutter/material.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';

class BoardContent extends StatefulWidget {
  const BoardContent({Key? key}) : super(key: key);

  @override
  State<BoardContent> createState() => _BoardContentState();
}

class _BoardContentState extends State<BoardContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Widget _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          DatabaseCubit.get(context).getAllTasks();
          return AppConstants.boardTabViewsList[0];
        case 1:
          DatabaseCubit.get(context).getCompletedTasks();
          return AppConstants.boardTabViewsList[1];
        case 2:
          DatabaseCubit.get(context).getUnCompletedTasks();
          return AppConstants.boardTabViewsList[2];
        case 3:
          DatabaseCubit.get(context).getFavoriteTasks();
          return AppConstants.boardTabViewsList[3];
        default:
          return const Text('no tasks found');
      }
    }
    return const Text('no tasks found');
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: AppConstants.boardTabViewsList.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      // TODO: implement handle tabs method responding to sql database
      _handleTabSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
      child: Column(
        children: [
          Expanded(
            child: TabBarView(controller: _tabController, children: AppConstants.boardTabViewsList),
          ),
          MyButtonWidget(
            label: AppStrings.addTaskButtonLabel,
            onPressed: () => Navigator.pushNamed(context, Routes.addTaskRoute),
          ),
        ],
      ),
    );
  }
}
