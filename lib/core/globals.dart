
import 'package:intl/intl.dart';
import 'export.dart';

RxString token = "".obs;
RxString currentAddress = ''.obs;
RxBool addressLoader = false.obs;

RxBool isDisable = false.obs;
RxDouble longitude = 0.0.obs;
RxDouble latitude = 0.0.obs;
HiveCollection hiveCollection = HiveCollection.instance;
final GlobalKey<ScaffoldState> scaffoldKeyN =  GlobalKey<ScaffoldState>();

List<CameraDescription> cameras = [];
bool isFrontOrNot = true;
bool isLocPermissionShow = false;

DateFormat sendDateFormat = DateFormat("yyyy-MM-dd");
DateFormat getDateFormat = DateFormat("dd-MM-yyyy");

RxBool checkNet = true.obs;