# SwiftSPM: Your Swift Package Manager Configuration Tool
![SwiftSPM](https://github.com/hassanvfx/ios-framework/assets/425926/0e2d791e-15f7-467e-8ddb-04ebb871796d)

## Overview
SwiftSPM is a powerful and user-friendly Swift Package Manager (SPM) template and configuration tool. It allows you to clone and rename all your symbols, creating your own custom SDK library, MyOwnSDK, in conjunction with a test Tandem App in a matter of seconds. 

## Key Features
- **Dynamic Linking:** The DemoApp dynamically links to the SPM folder, enabling immediate reflection of any changes in the framework without the need for repository updates.
- **Instant Reflection:** Any changes made in the SPM are instantly reflected in the DemoApp.
- **Configuration tool:** Run one command line to rename the library and optionally upload to your GH repo
- **Linking from Other Apps:** You can link from other apps by publishing to GitHub and creating a TAG version.

## Tutorial & Documentation
For a comprehensive analysis on iOS Codebase modularization, please visit the following link:
- [Medium Tutorial](https://twinchat.medium.com/building-reactive-applications-with-swiftui-and-combine-a-tutorial-on-ios-app-simple3d-25d18eef7649)

While SwiftSPM adheres to Apple's general implementation principles, it introduces a unique variation with a focus on automation and the placement of the SPM Package.swift at the top level. This setup ensures standardized external linking while keeping the DemoApp organized within its dedicated subfolder.

Apple references:
1. [Developing a Swift Package in Tandem with an App](https://developer.apple.com/documentation/xcode/developing-a-swift-package-in-tandem-with-an-app)
2. [Editing a Package Dependency as a Local Package](https://developer.apple.com/documentation/xcode/editing-a-package-dependency-as-a-local-package)

## Quick Setup
![Setup](https://github.com/hassanvfx/ios-framework/assets/425926/8cb61044-36ba-48e4-9a0d-e2b736d767af)

- Clone the repository.
- Optionally, prepare an empty GitHub repository and get the HTTPS or SSH address.
- Run the `./config.sh` script.
- Enter your SPM name.
- Optionally, enter the empty remote GitHub repository you want to push to.
- The folder containing the repository will change to ios-{YourFramework}.

## Testing
- After running the config tool, navigate to the DemoApp folder and run the Xcode Project.

## SPM Linking
- Run the config tool and upload the SPM to GitHub.
- Create a tag and push with `git push origin --tags`.
- You can then link your new library to any specific tag.

## Versioning
If you want to automate your semantic version check out this handy command line util:
https://github.com/hassanvfx/versioned_tag

## Caveats
The project structure shows the DemoApp folder twice, once within the ios-framework and again as the main app. Avoid accessing the DemoApp folder from the ios-framework top directory.

## Notes
1. You can remove the Framework Test target, the Demo App XCTest, and/or XCUITest targets if they are not in use.
2. The DemoApp should simply expose the framework's use and not demonstrate anything else. If you need to show the use of a specific feature, write a DemoApp XCUITest or a new DemoApp target.
