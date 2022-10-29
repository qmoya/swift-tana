import SnapshotTesting
import XCTest
@testable import Tana

final class TanaTests: XCTestCase {
	func testDecoding() throws {
		SnapshotTesting.diffTool = "ksdiff"

		let urls = Bundle.module.paths(forResourcesOfType: "json", inDirectory: "Samples")
			.compactMap { URL(fileURLWithPath: $0) }
		let decoder = JSONDecoder()
		for url in urls {
			let data: Data = try .init(contentsOf: url)
			let doc = try decoder.decode(File.self, from: data)
			assertSnapshot(matching: doc, as: .dump)
		}
	}
}
