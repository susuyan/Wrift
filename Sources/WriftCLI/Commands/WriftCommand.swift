import Foundation
import PathKit
import SwiftCLI
import WriftKit

class WriftCommand: Command {

    let wrift: Wrift
    let name: String
    let shortDescription: String
    let longDescription: String

    init(wrift: Wrift, name: String, description: String, longDescription: String = "") {
        self.wrift = wrift
        self.name = name
        shortDescription = description
        self.longDescription = longDescription
    }

    func execute() throws {}
}
