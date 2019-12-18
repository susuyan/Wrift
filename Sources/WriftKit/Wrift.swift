import Foundation
import PathKit
import Rainbow
import SwiftCLI

public class Wrift {

    public var path: Path
    public var linkPath: Path

    public var standardOut: WritableStream
    public var standardError: WritableStream

    public init(
        path: Path,
        linkPath: Path,
        standardOut: WritableStream = Term.stdout,
        standardError: WritableStream = Term.stderr
    ) {

        self.standardOut = standardOut
        self.standardError = standardError
        self.path = path.absolute()
        self.linkPath = linkPath.absolute()
    }

    func output(_ string: String) {
        standardOut.print("🌱  \(string)")
    }

    func errorOutput(_ string: String) {
        standardError.print("🌱  \(string)")
    }

    public func closeStreams() {
        standardOut.closeWrite()
        standardError.closeWrite()
    }

    public func newFile() {
        output("test 脚本成功 ！")
        print("hello world")
    }
}
