#!/bin/bash

# Ask for the new framework name
echo "Enter the name of your new framework:"
read framework_name

# Ask for the optional remote
echo "Enter your optional remote (press enter to skip):"
read remote

# Get the current directory name
current_directory=${PWD##*/}

# Move up one directory level
cd ..

# Rename the folder
mv $current_directory ios-$framework_name

# Navigate into the newly renamed folder
cd ios-$framework_name

# Rename files and directories
mv Sources/FrameworkLib/Framework.swift Sources/FrameworkLib/$framework_name.swift
mv Sources/FrameworkLib Sources/$framework_name
mv Tests/FrameworkLibTests/FrameworkTests.swift Tests/FrameworkLibTests/${framework_name}Tests.swift
mv Tests/FrameworkLibTests Tests/${framework_name}Tests
mv DemoApp/DemoApp.xcodeproj DemoApp/$framework_name.xcodeproj

# Replace strings in files
find 'Package.swift' -exec sed -i '' -e "s/FrameworkLib/$framework_name/g" {} \;
find Sources/$framework_name -type f -exec sed -i '' -e "s/Framework/$framework_name/g" {} \;
find Tests/${framework_name}Tests -type f -exec sed -i '' -e "s/FrameworkLib/$framework_name/g" {} \;
find DemoApp/DemoApp -type f -exec sed -i '' -e "s/FrameworkLib/$framework_name/g" {} \;
find DemoApp/DemoApp -type f -exec sed -i '' -e "s/Framework/$framework_name/g" {} \;
find DemoApp/${framework_name}.xcodeproj/project.pbxproj -type f -exec sed -i '' -e "s/FrameworkLib/$framework_name/g" {} \;

# Remove the .git folder and initialize a new git instance
rm -rf .git
git init
git branch -m main

# Replace the contents of the README
echo "# $framework_name" > README.md
echo "" >> README.md
echo "This framework was built with the ios-framework  config tool." >> README.md
echo "[https://github.com/hassanvfx/ios-framework](https://github.com/hassanvfx/ios-framework)" >> README.md

git add .
git commit -am 'initial commit'

# If a remote was provided, add it
if [ -n "$remote" ]; then
    git remote add origin $remote
    git push origin main
fi


# Rename the Xcode project

echo "Done! (Note: clone again to re-config)"
