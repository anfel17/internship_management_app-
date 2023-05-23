import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//Api routes
const baseUrl = 'http://192.168.1.11:8000/api/';
const consultStudentAccount = baseUrl + 'consultStudentAccount';
const consultOffersList = baseUrl + 'consultOffersList';
const getStudentNotif = baseUrl + 'getStudentNotif';
const login = baseUrl + 'login';
const modifyStudentAccount = baseUrl + 'modifyStudentAccount';
const unseenStudentNotifNbr = baseUrl + 'unseenStudentNotifNbr';
const seeStudentNotif = baseUrl + 'seeStudentNotif';
const createApplication = baseUrl + 'createApplication';
const applicationsList = baseUrl + 'applicationsList';
const modifyApplication = baseUrl + 'modifyApplication';
const checkMarks = baseUrl + 'checkMarks';
const applyForInternship = baseUrl + 'applyForInternship';
const consultAttendance = baseUrl + 'consultAttendance';

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF276887), Color(0xFFFF7643)],
);


Color lightgreenshede = Color(0xFFF0FAF6);
Color lightgreenshede1 = Color(0xFFB2D9CC);
Color greenshede0 = Color(0xFF66A690);
Color greenshede1 = Color(0xFF93C9B5);
Color primarygreen = Color(0xFF1E3A34);
Color grayshade = Color(0xFF93B3AA);
Color colorAcent = Color(0xFF78C2A7);
Color cyanColor = Color(0xFF6D7E6E);

const kAnimationDuration = Duration(milliseconds: 200);
