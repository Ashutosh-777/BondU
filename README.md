# [BondU](www.app.bondu.in)

**BondU** is a digital business card and networking platform designed to transform the way professionals connect, exchange information, and follow up at events like exhibitions, expos, summits, and trade shows.Visit us at [BondU](www.app.bondu.in)

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Screenshots](#screenshots)
6. [Dependencies](#dependencies)
7. [Contributing](#contributing)
8. [License](#license)
9. [Contact](#contact)

## Introduction

**BondU** is built to make networking seamless and efficient. With OTP-based authentication, customizable digital business cards, advanced analytics, and QR code sharing, BondU helps professionals maintain and grow their network with ease.

## Features

- **OTP-based Authentication**: Secure user login using OTPless SDK for easy and safe access.
- **User Profile Management**: New users can create and edit their profile details.
- **Home Screen Overview**: View profile stats, including profile views and digital business card details.
- **Digital Business Card**: Create and display a digital business card with all your professional details.
- **Analytics Dashboard**: Track your profile views, shares, social link taps, and more with detailed analytics.
- **Contacts Management**: Manage and view a list of all your connections. Connect with new users and share your profile.
- **QR Code Sharing**: Share your profile via QR code or deep links.
- **Deep Linking**: Seamlessly connect with others through shared links that directly open the app.
- **Real-Time Notifications**: Get notified instantly when someone connects with you using Firebase notifications.

## Installation

To run this project locally, follow these steps:

### Prerequisites

- **Flutter SDK**: Version 3.x.x or higher
- **Dart SDK**: Version 2.x.x or higher
- **Android Studio** or **Xcode** for iOS development

### Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ashutosh-777/BondU.git
   cd bondU
   ```

2. **Install dependencies:**

   Run the following command to install all required dependencies:

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   To run the app on an emulator or a physical device, use:

   ```bash
   flutter run
   ```

## Usage

### Creating a Profile

1. On the first launch, users will be prompted to enter their details to create a profile.
2. Fill in your professional details and save them to generate your digital business card.

### Navigating the Home Screen

- **Profile Views**: See who viewed your profile and how many times.
- **Business Card**: View your digital business card and share it with others.
- **Analytics**: Check your profile's performance with data on views, shares, and taps over the past 5 days.

### Connecting with Others

- Go to the **Contacts** section to see who has connected with you.
- Use the **QR Code** or **Deep Linking** feature to share your profile with others.

### Notifications

- Receive real-time notifications whenever someone connects with you.

## Demo


![Home Screen](https://example.com/screenshot1.png)
![Analytics Screen](https://example.com/screenshot2.png)

## Dependencies

The project relies on several dependencies to provide its functionalities. Here's a list of all the dependencies used:

- **Core Dependencies:**
  - `auto_size_text: ^3.0.0` - A widget to automatically resize text to fit within its bounds.
  - `cupertino_icons: ^1.0.2` - Cupertino icons for iOS styling.
  - `dio: ^5.4.0` - A powerful HTTP client for Dart, which supports interceptors, global configuration, and much more.
  - `firebase_core: ^3.2.0` - Core Firebase SDK for Flutter apps.
  - `firebase_messaging: ^15.0.3` - Firebase Cloud Messaging integration for notifications.
  - `flutter_contacts: ^1.1.8` - A plugin to manage contacts on both Android and iOS.
  - `flutter_inner_shadow: ^0.0.1` - Allows adding inner shadows to widgets.
  - `flutter_local_notifications: ^17.2.1+2` - Provides cross-platform APIs for displaying local notifications.
  - `go_router: ^14.2.1` - A routing package for Flutter.
  - `intl: ^0.19.0` - Internationalization and localization utilities.
  - `open_filex: ^4.4.0` - A plugin to open files on Android and iOS.
  - `otpless_flutter: ^2.1.3` - SDK for OTP-less authentication.
  - `path_provider: ^2.1.3` - A plugin to access commonly used locations on the filesystem.
  - `pretty_dio_logger: ^1.3.1` - A logger for Dio requests and responses.
  - `provider: ^6.1.1` - A state management library.
  - `qr_flutter: ^4.1.0` - QR code generator for Flutter.
  - `qr_image_generator: ^0.2.9` - A plugin for generating QR images.
  - `share_plus: ^7.2.2` - A plugin to share content with other apps.
  - `shared_preferences: ^2.2.3` - A plugin to store key-value pairs persistently.
  - `syncfusion_flutter_charts: ^25.1.35` - A package for creating charts in Flutter.
  - `toast: ^0.3.0` - A plugin to show native toasts.
  - `url_launcher: ^6.3.0` - A plugin for launching URLs.
  - `webview_flutter: ^4.5.0` - A plugin to embed a webview within Flutter apps.

- **Development Dependencies:**
  - `dependency_validator: ^4.1.0` - Helps in validating the dependency tree of the Flutter project.
  - `flutter_lints: ^4.0.0` - Contains recommended lints for Flutter projects.
  - `icons_launcher: ^2.1.7` - A tool for generating app icons.
  - `change_app_package_name: ^1.3.0` - Utility to change the app package name.

## Contributing

We welcome contributions! If you would like to contribute to BondU, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature-name`).
6. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Contact

For any questions or feedback, please contact:

- **Email**: [ashutosh.eee21@iitg.ac.in](mailto:ashutosh.eee21@iitg.ac.in)
- **GitHub**: [ashutosh-777](https://github.com/ashutosh-777)
- **LinkedIn**: [Ashutosh Kumar](https://www.linkedin.com/in/ashutosh-kumar-936383230/)
