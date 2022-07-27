import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/db_state.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';

class BoardContent extends StatefulWidget {
  BoardContent({Key? key}) : super(key: key);

  @override
  State<BoardContent> createState() => _BoardContentState();
}

class _BoardContentState extends State<BoardContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: AppConstants.boardTabViewsList.length,
        vsync: this,
        initialIndex: 0);
    _tabController.addListener(() {
      // TODO: implement handle tabs method responding to sql database
      // _handleTabsSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<DatabaseCubit, DatabaseState>(
              builder: (context, state) {
                return TabBarView(
                    controller: _tabController,
                    children: AppConstants.boardTabViewsList);
              },
            ),
          ),
          MyButtonWidget(
            label: AppStrings.addTaskButtonLabel,
            onPressed: () => Navigator.pushNamed(context, Routes.addTaskRoute),
          ),
        ],
      ),
    );
  }

//   void _handleTabSelection() {
//     if (_tabController.indexIsChanging) {
//       switch (_tabController.index) {
//         case 0:
//           filterData('all');
//           break;
//         case 1:
//           filterData('experienceConsulting');
//           break;
//         case 2:
//           filterData('frontOfficeTransformation');
//           break;
//       }
//     }
//   }
}
