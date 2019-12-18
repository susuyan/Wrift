import Foundation
import PathKit
import Rainbow
import SwiftCLI
import WriftKit

public class WriftCLI {
    public let version = "0.1.0"

    let wrift: Wrift
    let cli: CLI

    public init() {

        var wriftPath: Path = "/usr/local/lib/wrift"
        var linkPath: Path = "/usr/local/bin"

        if let path = ProcessInfo.processInfo.environment["WRIFT_PATH"], !path.isEmpty {
            wriftPath = Path(path)
        }
        if let path = ProcessInfo.processInfo.environment["WRIFT_LINK_PATH"], !path.isEmpty {
            linkPath = Path(path)
        }

        wrift = Wrift(path: wriftPath, linkPath: linkPath)

        cli = CLI(name: "wrift", version: version, description: "blog command", commands: [NewCommand(wrift: wrift)])
    }

    public func execute(arguments: [String]? = nil) {
        let status: Int32
        if let arguments = arguments {
            status = cli.go(with: arguments)
        } else {
            status = cli.go()
        }
        exit(status)
    }
}

extension WriftError: ProcessError {

    public var message: String? {
        return "🌱  \(description.red)"
    }

    public var exitStatus: Int32 {
        return 1
    }
}
