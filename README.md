# SPM Framework Template

The following offers a base template as a starting  point for any SPM related project. 
- DemoApp dynamically links the SPM through Xcode special linking feature
- Changes in SPM reflect immdiately in the DemoApp
- Ensures the Library will be compiled when exported
- In order to link from other aps, publish to GH and create  TAG version


# How to use?

### PREPARTION
- clone the repo
- rename folder `ios-{YOUR_FRAMEWORK_NAME}`
- remove the origin `git remote remove origin`
- add your own origin `git remote add {your origin}`
- open the `Xcode project` inside `DemoApp`
- notice inside the workspace both the `SPM` and the `DemoApp`
- rename `Xcode project` called `DemoApp.xcodeproj` by a relevant `{YOUR_FRAMEWORK_NAME}.xcodeproj`


### LIB UPDATE (SPM FOLDER)
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

### APP UPDATE (DemoApp Folder)
- Open the `DemoApp Target` settings, in `General` go to `Frameworks` and:
  - remove the placeholder "Framework" import
  - add your library target  called `{YOUR_FRAMEWORK_NAME}Lib`
- Open the swift file `DemoAppApp.swift` and rename the `import Framework` to match  `import {YOUR_FRAMEWORK_NAME}Lib`
- As confirmation build the `DemoApp` target and it should work
- Finally rename `DemoApp` project by `{YOUR_FRAMEWORK_NAME}`

From here on you are ready to continue developing your Demo application and SPM in tandem.

### Linking

- Link to any other app by tagging your code 
- and pushing into a public repo
- then import using xcode SPM standard tool

--
##### Notes:
1. Take note that the framework name isn't the same name as the GitHub repo. The framework name is `{YOUR_FRAMEWORK_NAME}Lib` and. the repo name is `{YOUR_FRAMEWORK_NAME}`.
1. Please avoid the name `{YOUR_FRAMEWORK_NAME}Lib` in public clases/structs.
1. Feel free to remove either the Framework Test target, and/or the Demo App XCTest, and/or XCUITest targets in case that either one is not in use in your case.
1. DemoApp should be simple and expose the framework's use, not intended to demonstrate anything else. In case that is needed to show the use of one specific feature the approach should be to write a DemoApp XCUITest or a new DemoApp target.
1. Repo name, which in this case is named `ios-{YOUR_FRAMEWORK_NAME}`, could be anything else too.
