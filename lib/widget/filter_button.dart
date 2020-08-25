import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/filter_todo/filter_todo_bloc.dart';
import 'package:todo_test2/models/visible_filter.dart';

class FilterButton extends StatelessWidget {

  final bool visible;

  FilterButton({@required this.visible});

  @override
  Widget build(BuildContext context) {

    final defaultStyle = Theme.of(context).textTheme.bodyText2;
    final activeStyle = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).accentColor);

    return BlocBuilder<FilterTodoBloc, FilterTodoState>(
      builder: (context, state){
        final button = _Button(
          onSelected: (filter)=>BlocProvider.of<FilterTodoBloc>(context),
          activeFilter: VisibleFilter.ALL,
          activeStyle: activeStyle,
          defaultStyle: defaultStyle,
        );

        return AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: Duration(microseconds: 150),
          child: visible? button : IgnorePointer(child: button,),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  final PopupMenuItemSelected<VisibleFilter> onSelected;
  final VisibleFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  _Button(
      {@required this.onSelected,
      @required this.activeFilter,
      @required this.activeStyle,
      @required this.defaultStyle});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<VisibleFilter>>[
        PopupMenuItem<VisibleFilter>(
          value: VisibleFilter.ALL,
          child: Text('show All',
              style: activeFilter == VisibleFilter.ALL
                  ? activeStyle
                  : defaultStyle),
        ),
        PopupMenuItem<VisibleFilter>(
          value: VisibleFilter.ACTIVE,
          child: Text('active',
              style: activeFilter == VisibleFilter.ACTIVE
                  ? activeStyle
                  : defaultStyle),
        ),
        PopupMenuItem<VisibleFilter>(
          value: VisibleFilter.COMPLETE,
          child: Text(
            'complete',
            style: activeFilter == VisibleFilter.COMPLETE
                ? activeStyle
                : defaultStyle,
          ),
        )
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}
