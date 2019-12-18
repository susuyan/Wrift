import Foundation
import SwiftCLI

public enum WriftError: Error, CustomStringConvertible, Equatable, LocalizedError {

    case exist(String)

    public var description: String {
        switch self {
        case let .exist(file): return "文件已存在\(file)"
        }
    }

    public static func == (lhs: WriftError, rhs: WriftError) -> Bool {
        return lhs.description == rhs.description
    }

    public var errorDescription: String? {
        return description
    }
}
