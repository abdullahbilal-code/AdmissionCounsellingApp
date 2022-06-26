import 'package:flutter/material.dart';
import 'package:admissioncounsellingapp/MenuItem.dart';

class MenuItems {
  static const List<Menuitem> itemlist = [
    editorupdate,
    deleteaccount,
  ];
  static const List<Menuitem> itemlist2 = [
    addDepartment,
    editorupdate,
  ];
  static const List<Menuitem> itemlist3 = [
    addprogram,
    editorupdate,
  ];

  static const addDepartment = Menuitem(
    text: 'Add Department',
    icon: Icons.add,
  );

  static const editorupdate = Menuitem(
    text: 'Edit/Update',
    icon: Icons.edit,
  );
  static const deleteaccount = Menuitem(
    text: 'DeleteAccount',
    icon: Icons.delete,
  );

  static const addprogram = Menuitem(
    text: 'add program',
    icon: Icons.add,
  );
}
