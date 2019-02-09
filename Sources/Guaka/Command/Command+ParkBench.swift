// 

import Foundation

extension Command {
	@available(*, deprecated, message:"user guard(countIs:statusCode:)")
	public func `guard`(_ args:[String], countInRange range:CountableClosedRange<Int>, statusCode: Int = -1) {
		self.guard(args, countIs: range, statusCode: statusCode)
	}
	
	public func `guard`(_ args:[String], countIs range:CountableClosedRange<Int>, statusCode: Int = -1) {		guard case range = args.count else {
			if args.count < range.lowerBound {
				print("Too few arguments.")
			} else {
				print("Too many arguments.")
			}
			
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
			
			fail(statusCode: statusCode)
		}
	}
}

