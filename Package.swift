// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "Guaka",
	products: [
		.library( name: "Guaka", targets: ["Guaka"]),
    ],
    dependencies:[
    	.package(url: "https://github.com/klaas/StringScanner", from: "0.3.0"),
	],
	targets: [
		.target(name: "Guaka", dependencies: ["StringScanner"]),
	]
)
