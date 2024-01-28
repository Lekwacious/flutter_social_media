# socialmedia

A new Flutter project.

## Getting Started

This project is a test application for devrecruit Flutter mobile developer recruitment. The project uses [Firebase](https://firebase.google.com/) for authentication and firebase storage for saving uploaded files. The project also uses cloud firestore as a NOSQL database to persist data. The project also uses [image_picker](https://pub.dev/packages/image_picker) for image handling.
The project uses [Getx](https://pub.dev/packages/get) for state management, navigation and dependency injection etc. It uses the reactive streams called Obx to listen to events.
To run the project, you need to install [Dart](https://dart.dev/) and the [Flutter SDK](https://docs.flutter.dev/get-started/codelab) to your personal computer. You can use any development environment of your choice preferably [Android studio](https://developer.android.com/studio?gclid=CjwKCAiA8NKtBhBtEiwAq5aX2HPDbFKW-Bj0wgAQrvueFV6aDbHFBsRzWz5Tb80yst1zQx8llQ2j5RoCADcQAvD_BwE&gclsrc=aw.ds).

A few resources to get you started if this is your first Flutter project:


- To run the project, clone the repository, get the dependences by running `flutter pub get`, then `flutter run`
- The project uses the model view Controller architectural design pattern. The controllers are subclases of Getx Controller, which is the state manager useed.
- The project uses Getx Navigator for routing. To move to the next screen, you simply do `Get.to(()=>NewScreen())` . The controller contains the business logic, hence ensured saperation of concerns
- The view contains the code the UI
- The component folder contains reusable classes and components.
- The project used observable stream capabilities of Getx throuh OBX


