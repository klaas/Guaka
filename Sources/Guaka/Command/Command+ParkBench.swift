//
//  Command+ParkBench.swift
//  Guaka
//
//  Created by Klaas on 02/22/2017.
//
//


extension Command {
	public func `guard`(_ args:[String], countInRange range:CountableClosedRange<Int>, statusCode: Int = -1) {
		guard case range = args.count else {
			if args.count < range.lowerBound {
				print("Too few arguments.")
			} else {
				print("Too many arguments.")
			}
			
			print( helpMessage)
			fail(statusCode: statusCode)
		}
	}
	public func `guard`(_ args:[String], countIs count:Int, statusCode: Int = -1) {
		guard count == args.count else {
			if args.count < count {
				print("Too few arguments.")
			} else {
				print("Too many arguments.")
			}
			
			print( helpMessage)
			fail(statusCode: statusCode)
		}
	}
}

