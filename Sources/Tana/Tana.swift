import Foundation

public enum NodeType: String, Codable {
	case field
	case image
	case codeBlock = "codeblock"
	case node
	case date
}

public enum TodoState: String, Codable {
	case toDo = "todo"
	case done
}

public struct Node: Codable {
	public let uid: String?
	public let name: String

	// children
	public let children: [Node]?

	// reference uids
	public let refs: [String]?

	// created at timestamp
	public let createdAt: TimeInterval?

	// edited at timestamp
	public let editedAt: TimeInterval?

	// the various types of nodes we support
	public let type: NodeType

	// used for media url
	public let mediaURL: URL?

	// for code blocks
	public let codeLanguage: String?

	public let supertags: [String]?

	// if set, we will create TODO / DONE for this node
	public let todoState: TodoState?
}

public struct Supertag: Codable {
	public let uid: String
	public let name: String
}

public struct Summary: Codable {
	// the number of leaf nodes
	public let leafNodes: Int

	// the number of root level nodes (will go into Library)
	public let topLevelNodes: Int

	// the total number of nodes found
	public let totalNodes: Int

	// number of nodes that will end up as day nodes in the calendar
	public let calendarNodes: Int

	// the number of fields
	public let fields: Int

	// number of broken references
	public let brokenRefs: Int
}

public enum DataType: Codable {
	case any
	case url
	case email
	case number
	case date
	case checkbox
}

public struct Attribute: Codable {
	public let name: String
	public let values: [String]?
	public let count: Int
	public let dataType: DataType?
}

public struct File: Codable {
	// version flag for the import format.
	public let version: String

	// summary of the contents in the file
	public let summary: Summary?

	// all nodes
	public let nodes: [Node]

	// all attributes
	public let attributes: [Attribute]?

	// all attributes
	public let supertags: [Supertag]?
}
