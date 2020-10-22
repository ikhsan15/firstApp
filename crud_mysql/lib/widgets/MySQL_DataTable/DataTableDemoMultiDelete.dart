import 'package:flutter/material.dart';
import 'Employees.dart';
import 'Services.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Data Table Flutter Demo";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<Employee> _employees;
  List<Employee> _selectedEmployees;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _selectedEmployees = [];
    _employees = [];
    _scaffoldKey = GlobalKey();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _getEmployees();
  }

  _createTable() {
    Services.createTable().then((result) {
      showSnackBar(context, result);
    });
  }

  _addEmployee() {
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty) {
      print("Empty fields");
      return;
    }
    Services.addEmployee(_firstNameController.text, _lastNameController.text)
        .then((result) {
      if (result == 'success') {
        _getEmployees();
      }
      _firstNameController.text = '';
      _lastNameController.text = '';
      showSnackBar(context, result);
    });
  }

  _getEmployees() {
    Services.getEmployees().then((employees) {
      setState(() {
        _employees = employees;
      });
      print("Length: ${employees.length}");
    });
  }

  // _deleteEmployee(Employee employee) {
  //   if (null != employee) {
  //     _selectedEmployees.clear();
  //     _selectedEmployees.add(employee);
  //   }

  //   if (_selectedEmployees.isNotEmpty) {
  //     List<Employee> temp = [];
  //     temp.addAll(_selectedEmployees);
  //     for (Employee employee in temp) {
  //       Services.deleteEmployee(employee.id).then((result) {
  //         if (result == 'success') {
  //           setState(() {
  //             _employees.remove(employee);
  //             _selectedEmployees.remove(employee);
  //           });
  //         }
  //       });
  //     }
  //   }
  // }

  _deleteEmployee(Employee employee) {
    Services.deleteEmployee(employee.id).then((result) {
      if (result == 'success') {
        setState(() {
          _employees.remove(employee);
          _selectedEmployees.remove(employee);
        });
      }
    });
  }

  // _onSelectedRow(bool selected, Employee employee) async {
  //   setState(() {
  //     _firstNameController.text = employee.firstName;
  //     _lastNameController.text = employee.lastName;
  //     if (selected) {
  //       _selectedEmployees.add(employee);
  //     } else {
  //       _selectedEmployees.remove(employee);
  //     }
  //   });
  // }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text("ID"),
                numeric: false,
                tooltip: "This is the employee id"),
            DataColumn(
                label: Text(
                  "FIRST NAME",
                ),
                numeric: false,
                tooltip: "This is the last name"),
            DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is the last name"),
            DataColumn(
                label: Text("DELETE"),
                numeric: false,
                tooltip: "Delete Action"),
          ],
          rows: _employees
              .map(
                (employee) => DataRow(
                  // selected: _selectedEmployees.contains(employee),
                  // onSelectChanged: (b) {
                  //   _onSelectedRow(b, employee);
                  // },
                  cells: [
                    DataCell(
                      Text(employee.id),
                      onTap: () {
                        print("Tapped " + employee.firstName);
                      },
                    ),
                    DataCell(
                      Text(
                        employee.firstName.toUpperCase(),
                      ),
                      onTap: () {
                        print("Tapped " + employee.firstName);
                      },
                    ),
                    DataCell(
                      Text(
                        employee.lastName.toUpperCase(),
                      ),
                      onTap: () {
                        print("Tapped " + employee.firstName);
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteEmployee(employee);
                        },
                      ),
                      onTap: () {
                        print("Tapped " + employee.firstName);
                      },
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getEmployees();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration.collapsed(
                  hintText: "First Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration.collapsed(
                  hintText: "Last Name",
                ),
              ),
            ),
            Expanded(
              child: _dataBody(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEmployee();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
