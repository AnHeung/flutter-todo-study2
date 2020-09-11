import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/todo.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSaveCallback;
  final Todo todo;

  AddEditScreen({this.isEditing, this.onSaveCallback, this.todo});

  @override
  State<StatefulWidget> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _task;
  String _note;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) => Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: isEditing ? Text('수정하기') : Text('일정추가'),
              ),
              body: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          initialValue: isEditing ? widget.todo.task : '',
                          autofocus: !isEditing,
                          style: Theme.of(context).textTheme.headline5,
                          decoration: InputDecoration(hintText: '할일 적어'),
                          validator: (value) =>
                              value.trim().isEmpty ? "텍스트를 입력해주세요" : null,
                          onSaved: (value) => _task = value,
                        ),
                        TextFormField(
                          initialValue: isEditing ? widget.todo.note : '',
                          maxLines: 10,
                          style: Theme.of(context).textTheme.subtitle1,
                          decoration: InputDecoration(hintText: '입력할 내용을 적으세요'),
                          onSaved: (value) => _note = value,
                        )
                      ],
                    ),
                  )),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    widget.onSaveCallback(_task , _note);
                    Navigator.pop(context);
                  }
                },
                child: isEditing ? Icon(Icons.edit) : Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}

