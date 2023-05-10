import 'package:flutter/material.dart';

//Api routes
const baseUrl = 'http://192.168.1.9:8000/api/';
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
