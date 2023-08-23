# Dog Breeds App

This is a project developed as part of the challenge proposed by Shaw and Partners to assess 
mobile development skills (Flutter).

![20230823_101233 (4)](https://github.com/DiegoSCastro/favorite_products/assets/66894278/d6ee01fc-04ee-49fd-a06b-c2c58a5b5213)

## Objective:

The objective of this challenge is to create an application that lists dog breeds and their 
images, consuming the API provided by the client.

GET /api/breeds/list/all - Returns a list of all available breeds.
GET /api/breed/{breed name}/images - Returns a list of all available images for a specific breed.

### Run Instructions:

This application was created using Flutter version 3.13.0. To run it, you need to have Flutter 
version 3.0.0 or higher and Dart version 3.0.6 or higher installed.

Clone this repository to your local machine.
Make sure you have the Flutter SDK installed on your machine.

### Open the project and run the command:

flutter pub get

### Run automated tests using the command:

flutter test

### Run the app as a user:

If you want to test it as an end user or QA, download and install the file below on an Android device.

Download the file -

## Implemented Features:

Breed Listing (Home Page): The breed listing screen allows users to view all available breeds. They 
can also favorite a breed by tapping the heart icon, adding it to the favorites list.

Breed Detail (Breed Detail Page): When tapping on a breed in the list, users are directed to the 
breed details screen. On this screen, they can view images related to the breed and select 
options to  view its sub-breeds.

Favorites (Favorites Page): The app has a dedicated screen to display all breeds favorited by the 
user. Additionally, up to five images associated with each breed are displayed on the screen, 
provided these images are cached.

Image Details (FullScreen Page): Selecting an image displays it in full screen, allowing users to 
use pinch-to-zoom gestures. Moreover, users can access the image URL link.

Unit and Widget Testing: To ensure app quality, we've implemented unit and widget tests. We've 
used the flutter_test and mocktail libraries to create and execute automated tests. Currently, 
our project has a test coverage of over 50%.

Dependency Injection: We've utilized dependency injection through the get_it package. This 
approach enhances the separation of dependencies, making the code more modular and facilitating 
testing.

Local Data Storage: We've implemented the shared_preferences package to store data locally, 
enabling efficient storage of relevant information.

State Management: We've chosen to employ Flutter's state management to reactively update the 
user interface when data changes. We've used "Bloc" to reflect these changes in the user interface.

Image Caching: The "cached_network_image" package is utilized to efficiently load and cache web 
images. This enhances app performance by displaying preloaded images.


