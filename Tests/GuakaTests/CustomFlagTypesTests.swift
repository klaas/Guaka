//
//  CustomFlagTypes.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 06/11/2016.
//
//

import XCTest
@testable import Guaka

class CustomFlagTypesTests: XCTestCase {
  
  func testItCanSetAFlagWithACustomType() {
    
    struct CustomType: CommandStringConvertible {
      let val: String
      
      static func fromString(flagValue value: String) throws -> Any {
        return CustomType(val: value)
      }
      
      static var typeDescription: String { return "list" }
    }
    
    let fs = FlagSet(
      flags: [
        Flag(longName: "list", type: CustomType.self),
        ]
    )
    
    let (flags, _) = try! fs.parse(args: expand("--list cat"))
    
    let flag = flags.keys.first!
    let val = flags.values.first!
    XCTAssertEqual(flag.longName, "list")
    XCTAssertEqual((val as! CustomType).val, "cat")
  }
  
  func testItCanSetAFlagWithACustomTypeThatGeneratesAnError() {
    
    struct CustomType: CommandStringConvertible {
      let val: String
      
      static func fromString(flagValue value: String) throws -> Any {
        throw CommandConvertibleError.conversionError("cannot convert \(value) to \(typeDescription)")
      }
      
      static var typeDescription: String { return "list" }
    }
    
    let fs = FlagSet(
      flags: [
        Flag(longName: "list", type: CustomType.self),
        ]
    )
    
    do {
      _ = try fs.parse(args: expand("--list cat"))
      XCTFail()
    } catch CommandErrors.incorrectFlagValue(let x, let y) {
      XCTAssertEqual(x, "list")
      XCTAssertEqual(y, "cannot convert cat to list")
    } catch {
      XCTFail()
    }
  }
  
  func testItCanSetAFlagWithAnEnumWtihSuccess() {
    
    enum Animals: String, CommandStringConvertible {
      case dog = "dog"
      case cat = "cat"
      case donkey = "donkey"
      
      static func fromString(flagValue value: String) throws -> Any {
        guard let animal = Animals(rawValue: value) else {
          throw CommandConvertibleError.conversionError("Cannot create animal from \(value)")
        }
        return animal
      }
      
      static var typeDescription: String { return "animal can be (dog, cat, donkey)" }
    }
    
    
    let fs = FlagSet(
      flags: [
        Flag(longName: "love", type: Animals.self, required: true),
        ]
    )
    
    let (flags, _) = try! fs.parse(args: expand("--love cat"))
    
    let flag = flags.keys.first!
    let val = flags.values.first!
    XCTAssertEqual(flag.longName, "love")
    XCTAssertEqual((val as! Animals), Animals.cat)
  }
  
  func testItCanSetAFlagWithAnEnumWtihError() {
    
    enum Animals: String, CommandStringConvertible {
      case dog = "dog"
      case cat = "cat"
      case donkey = "donkey"
      
      static func fromString(flagValue value: String) throws -> Any {
        guard let animal = Animals(rawValue: value) else {
          throw CommandConvertibleError.conversionError("Cannot create animal from \(value)")
        }
        return animal
      }
      
      static var typeDescription: String { return "animal can be (dog, cat, donkey)" }
    }

    
    let fs = FlagSet(
      flags: [
        Flag(longName: "love", type: Animals.self, required: true),
        ]
    )
    
    do {
      _ = try fs.parse(args: expand("--love blah"))
      XCTFail()
    } catch CommandErrors.incorrectFlagValue(let x, let y) {
      XCTAssertEqual(x, "love")
      XCTAssertEqual(y, "Cannot create animal from blah")
    } catch {
      XCTFail()
    }
  }
  
  
}
