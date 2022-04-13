// import 'dart:developer';

// class PropertiesController extends GetxController {
//   List<Property> properties = <Property>[].obs;
//   //These 3 lists are for the explore page to filter out the properties based on their status.
//   List<Property> availabeProperties = <Property>[].obs;
//   List<Property> unAvailabeProperties = <Property>[].obs;
//   List<Property> soldProperties = <Property>[].obs;
//   RxBool isLoading = true.obs;
//   RxBool isError = false.obs;

//   @override
//   void onInit() {
//     isLoading(true);
//     isError(false);
//     fetchProperties();
//     super.onInit();
//   }

//   void fetchProperties() async {
//     isLoading(true);
//     try {
//       final response = await PropertiesRemote.fetchProperties();
//       if (response != null) {
//         properties = response;
//         filterPropertiesStatus();
//       } else {
//         //In the view, check if the list of the controller isEmpty to display an empty message.
//         properties = [];
//       }
//     } catch (e, st) {
//       log("Erorr while fetching the Property in the PropertyController: $e");
//       log("StackTrace: $st");
//     } finally {
//       isLoading(false);
//     }
//   }

//   void filterPropertiesStatus() {
//     for (int i = 0; i < properties.length; i++) {
//       if (properties[i].status == 'available') {
//         availabeProperties.add(properties[i]);
//       } else if (properties[i].status == 'sold') {
//         soldProperties.add(properties[i]);
//       } else {
//         unAvailabeProperties.add(properties[i]);
//       }
//     }
//   }
// }
