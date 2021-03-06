# Guaka

[![Build Status](https://travis-ci.org/oarrabi/Guaka.svg?branch=master)](https://travis-ci.org/oarrabi/Guaka)
[![codecov](https://codecov.io/gh/oarrabi/Guaka/branch/master/graph/badge.svg)](https://codecov.io/gh/oarrabi/Guaka)
[![Platform](https://img.shields.io/badge/platform-osx-lightgrey.svg)](https://travis-ci.org/oarrabi/Guaka)
[![Language: Swift](https://img.shields.io/badge/language-swift-orange.svg)](https://travis-ci.org/oarrabi/Guaka)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

`Guaka` is the smartest and most beautiful (POSIX compliant) Command line framework for Swift. Inspired by [cobra](https://github.com/spf13/cobra). 
(Also its a WIP)

`Guaka` promises the following:
- It can be statically linked: That means it does not use libFoundation, and does no rely on many thirdparty libs.
- Posix complient flags: It handles both short and long flag names. Flag names can appear anywhere (ala posix)
- Familiar with widely used cli apps: Have you used Docker, Kubernetes, OpenShift and Hugo. 
- Safe and crash free: Extensively covered with tests and with use cases.

Features:
- Easy to use interface (WIP)
- POSIX-Complient flags
- Inheritable and non inheritable flags
- Generator cli to easy generate a cli app (WIP)
- Levenshtein distance for subcommand names (WIP)
- Ability to have commands and subcommands (like git remote show has 3 subcommands)
- Generate a good help message (WIP)
- Man pages and bash completion (WIP)
- Manage settings from configuration files (WIP)
- Provides a way to generate custom help messages (WIP)
- Type safe flags (WIP)
- Ability to define your own structures as flag parameters (WIP)
- Generate command line apps from a configuration file (WIP)
- WIP

## Usage

WIP....


## Installation
You can install Guaka using Swift package manager (SPM) and carthage

### Swift Package Manager
Add swiftline as dependency in your `Package.swift`

```
  import PackageDescription

  let package = Package(name: "YourPackage",
    dependencies: [
      .Package(url: "https://github.com/oarrabi/Guaka.git", majorVersion: 0),
    ]
  )
```

### Carthage
    github 'oarrabi/Guaka'

## Tests
Tests can be found [here](https://github.com/oarrabi/Guaka/tree/master/Tests). 

Run them with 
```
swift test
```

## Todo

For a list of task planned, head to the [Guaka GitHub project](https://github.com/oarrabi/Guaka/projects/1)