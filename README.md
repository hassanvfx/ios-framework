# iOS Framework
![iOS Framework](https://github.com/hassanvfx/ios-framework/assets/425926/0e2d791e-15f7-467e-8ddb-04ebb871796d)

## Overview
This repository serves as a base template for Swift Package Manager (SPM) related projects. It includes a DemoApp that demonstrates the implementation and testing of the framework. The DemoApp dynamically links to the SPM folder, reflecting any changes in the framework instantly without the need to publish changes to the repository.

## Medium Tutorial

Please visit the following link for an in-depth analysis on iOS Codebase moularization.
- https://twinchat.medium.com/building-reactive-applications-with-swiftui-and-combine-a-tutorial-on-ios-app-simple3d-25d18eef7649

## Apple Docs

Please note that while this Tandem App follows the general implementation principles outlined by Apple, it introduces an opinionated variation. The main advantage of this approach is its focus on automation and the placement of the SPM Package.swift at the top level. This setup ensures standardized external linking while keeping the DemoApp organized within its dedicated subfolder.

Apple references:

1. [Developing a Swift Package in Tandem with an App](https://developer.apple.com/documentation/xcode/developing-a-swift-package-in-tandem-with-an-app)
2. [Editing a Package Dependency as a Local Package](https://developer.apple.com/documentation/xcode/editing-a-package-dependency-as-a-local-package)

## Features
- Dynamic linking of the DemoApp to the SPM using Xcode's special linking feature.
- Instant reflection of changes in the SPM in the DemoApp.
- Compilation of the library when exported.
- Linking from other apps by publishing to GitHub and creating a TAG version.

## Naming Conventions
- {ModuleName}Lib: For frameworks without any UI.
- {ModuleName}Kit: For frameworks with both models and UI elements.
- {ModuleName}SDK: For development toolset frameworks.

## Automatic Setup
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

## Caveats
The project structure shows the DemoApp folder twice, once within the ios-framework and again as the main app. Avoid accessing the DemoApp folder from the ios-framework top directory.

## Notes
1. You can remove the Framework Test target, the Demo App XCTest, and/or XCUITest targets if they are not in use.
2. The DemoApp should simply expose the framework's use and not demonstrate anything else. If you need to show the use of a specific feature, write a DemoApp XCUITest or a new DemoApp target.

## Manual Setup
If the automatic script is not sufficient, follow the steps below, which are essentially the same.

### Folder Updates
- Clone the repo.
- Rename the folder to `ios-{YOUR_FRAMEWORK_NAME}`.
- Remove the origin with `git remote remove origin`.
- Add your own origin with `git remote add {your origin}`.
- Open the `Xcode project` inside `DemoApp`.
- Notice both the `SPM` and the `DemoApp` inside the workspace.
- Rename the `Xcode project` called `DemoApp.xcodeproj` to `{YOUR_FRAMEWORK_NAME}.xcodeproj`.

### Package.swift Updates
- Open `Package.swift` and update the `{YOUR_FRAMEWORK_NAME}Lib` template.
- Rename the folder at `Sources/FrameworkLib` to `Source/{YOUR_FRAMEWORK_NAME}Lib`.
- After saving these changes, the `xcode schemas list` should display a new target called `{YOUR_FRAMEWORK_NAME}Lib`. If not, check for errors before continuing.

### XCode Projects Updates
- Open the `DemoApp Target` settings, go to `General` > `Frameworks`, remove the placeholder "Framework" import, and add your library target called `{YOUR_FRAMEWORK_NAME}Lib`.
- Open the swift file `DemoAppApp.swift` and rename the `import Framework` to `import {YOUR_FRAMEWORK_NAME}Lib`.
- Build the `DemoApp` target to confirm it works.
- Update the `bundle identifier` to `spree3d.com.{YOUR_FRAMEWORK_NAME}`.
- Update code signing as needed.

You are now ready to continue developing your Demo application and SPM in tandem.
