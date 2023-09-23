# SPM Tandem App

This repository provides a base template for any Swift Package Manager (SPM) related project. It includes an embedded DemoApp designed to demonstrate the implementation and facilitate easy testing of the framework. The DemoApp dynamically links to the SPM folder, instantly reflecting any changes in the framework without the need to publish changes to the repository.

Features:
- The DemoApp dynamically links to the SPM using Xcode's special linking feature.
- Changes in the SPM are immediately reflected in the DemoApp.
- The library will be compiled when exported.
- To link from other apps, publish to GitHub and create a TAG version.

# Naming Conventions

- {ModuleName}Lib: Use this if the framework doesn't feature any UI.
- {ModuleName}Kit: Use this if the framework features both models and UI elements.
- {ModuleName}SDK: Use this if the framework is a development toolset.

# Automatic Setup
<img width="419" alt="image" src="https://github.com/hassanvfx/ios-framework/assets/425926/8cb61044-36ba-48e4-9a0d-e2b736d767af">

- Clone the repository.
- Optionally, prepare an empty GitHub repository and obtain the correct HTTPS or SSH address.
- Run the `./config` script.
- Enter your SPM name.
- Optionally, enter the empty remote GitHub repository you want to push to.
- Note that the folder containing the repository has changed to ios-{YourFramework}.

# Testing

- After running the config tool, navigate to the DemoApp folder and run the Xcode Project.

# SPM Linking

- Ensure to run the config tool and upload the SPM to GitHub.
- Create a tag and push with `git push origin --tags`.
- You can then link your new library to any specific tag.

## Notes:
1. Feel free to remove either the Framework Test target, and/or the Demo App XCTest, and/or XCUITest targets in case that either one is not in use in your case.
1. DemoApp should be simple and expose the framework's use, not intended to demonstrate anything else. In case that is needed to show the use of one specific feature the approach should be to write a DemoApp XCUITest or a new DemoApp target.
  
---------
# Manual Setup

The following is only required in case the autmatic script is not enough, and are basically the same steps

### Folder updates
- clone the repo
- rename folder `ios-{YOUR_FRAMEWORK_NAME}`
- remove the origin `git remote remove origin`
- add your own origin `git remote add {your origin}`
- open the `Xcode project` inside `DemoApp`
- notice inside the workspace both the `SPM` and the `DemoApp`
- rename `Xcode project` called `DemoApp.xcodeproj` by a relevant `{YOUR_FRAMEWORK_NAME}.xcodeproj`

### Package.swift updates
- Open the `Package.swift` and update the following `{YOUR_FRAMEWORK_NAME}Lib` template :

```
let package = Package(
    name: "{YOUR_FRAMEWORK_NAME}Lib",
    products: [
        .library(
            name: "{YOUR_FRAMEWORK_NAME}Lib",
            targets: ["{YOUR_FRAMEWORK_NAME}Lib"]),
    ],
    targets: [
        .target(
            name: "{YOUR_FRAMEWORK_NAME}Lib",
            dependencies: []),
        .testTarget(
            name: "FrameworkTests",
            dependencies: ["{YOUR_FRAMEWORK_NAME}Lib"]),
    ]
)
```
- Rename the folder at `Sources/FrameworkLib` to match `Source/{YOUR_FRAMEWORK_NAME}Lib`
- After saving this changes you may expect the `xcode schemas list` to display a new target called `{YOUR_FRAMEWORK_NAME}Lib` else, verify any errors before continuing

### XCode Projects Updates
- Open the `DemoApp Target` settings, in `General` go to `Frameworks` and:
  - remove the placeholder "Framework" import
  - add your library target  called `{YOUR_FRAMEWORK_NAME}Lib`
- Open the swift file `DemoAppApp.swift` and rename the `import Framework` to match  `import {YOUR_FRAMEWORK_NAME}Lib`
- As confirmation build the `DemoApp` target and it should work
- Update the `bundle identifier` to match `spree3d.com.{YOUR_FRAMEWORK_NAME}`
- Update code signing as needed

From here on you are ready to continue developing your Demo application and SPM in tandem.





