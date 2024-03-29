import 'package:flutter/material.dart';
import '../create/step3.dart';

class CreateTaskScreen2 extends StatefulWidget {
  final int serviceId;
  CreateTaskScreen2({this.serviceId});
  @override
  _CreateTaskScreen2State createState() => _CreateTaskScreen2State();
}

class _CreateTaskScreen2State extends State<CreateTaskScreen2> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _validated = false;

  void _validate(val) {
    print(_titleController.text.length);
    if (_titleController.text.length >= 3 &&
        _descriptionController.text.length >= 3) {
      print('true');
      _validated = true;
    } else {
      _validated = false;
    }
    setState(() {});
  }

  void _nextScreen() {
    print(widget.serviceId.toString());
    print(_titleController.text);
    print(_descriptionController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskScreen3(
          serviceId: widget.serviceId,
          title: _titleController.text,
          description: _descriptionController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF68BB49),
        ),
        centerTitle: true,
        title: Text(
          'Создание задачи',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: _titleController,
                  onChanged: _validate,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Описание',
                    hintText: 'Добавьте описание задачи',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF68BB49),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: _descriptionController,
                  minLines: 2,
                  maxLines: 5,
                  onChanged: _validate,
                  decoration: InputDecoration(
                    labelText: 'Детали',
                    hintText: 'Добавьте детали задачи',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF68BB49),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(
                  color: Color(0xFF68BB49),
                  textColor: Colors.white,
                  onPressed: _validated ? _nextScreen : null,
                  child: Text(
                    'Далее',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
