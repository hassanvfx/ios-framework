# SPM Framework Template

The following offers a base template as a starting  point for any SPM related project. 
- DemoApp dynamically links the SPM through Xcode special linking feature
- Changes in SPM reflect immdiately in the DemoApp
- Ensures the Library will be compiled when exported
- In order to link from other aps, publish to GH and create  TAG version


# How to use?

### PREPARTION
- clone the repo
- rename folder `ios-{your name}`
- remove the origin `git remote remove origin`
- add your own origin `git remote add {your origin}`
- open the `Xcode workspace` inside `DemoApp`
- notice inside the workspace both the `SPM` and the `DemoApp`

### LIB UPDATE (SPM FOLDER)
- Open the `Package.swift` and update the following `{YOUR_FRAMEWORK_NAME}` template :
```
let package = Package(
    name: "{YOUR_FRAMEWORK_NAME}",
    products: [
        .library(
            name: "{YOUR_FRAMEWORK_NAME}",
            targets: ["{YOUR_FRAMEWORK_NAME}"]),
    ],
    targets: [
        .target(
            name: "{YOUR_FRAMEWORK_NAME}",
            dependencies: []),
        .testTarget(
            name: "FrameworkTests",
            dependencies: ["{YOUR_FRAMEWORK_NAME}"]),
    ]
)
```
- Rename the folder at `Sources/Framework` to match `Source/{YOUR_FRAMEWORK_NAME}`
- After saving this changes you may expect the `xcode schemas list` to display a new target called `{YOUR_FRAMEWORK_NAME}` else, verify any errors before continuing

### APP UPDATE (DemoApp Folder)
- Open the `DemoApp Target` settings, in `General` go to `Frameworks` and:
  - remove the placeholder "Framework" import
  - add your library target  called `{YOUR_FRAMEWORK_NAME}`
- Open the swift file `DemoAppApp.swift` and rename the `import Framework` to match  `import {YOUR_FRAMEWORK_NAME}`
- Finally build the `DemoApp` target and it should work

From here on you are ready to continue developing your Demo application and SPM in tandem.
