//
//  show.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import Guaka

var show: Command!

// Autogenerated but you can edit

func createShow() {
  show = Command(
  name: "show") { flags, args in
    print("Running git with \(flags) and \(args)")
  }
  
  remote.add(subCommands: show)
  
  
  // user will add these
  [
    Flag(longName: "foo", value: "-", inheritable: false),
    Flag(longName: "bar", value: "-", inheritable: false),
    Flag(longName: "yy", value: true, inheritable: false),
    ].forEach { show.add(flag: $0 ) }
}
