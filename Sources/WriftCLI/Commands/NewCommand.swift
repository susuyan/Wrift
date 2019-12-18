import Foundation
import PathKit
import SwiftCLI
import WriftKit

class NewCommand: WriftCommand {


    var arguments = OptionalCollectedParameter()
    
    init(wrift: Wrift) {
        super.init(wrift: wrift, name: "new", description: "create new file")
    }

    override func execute() throws {
        try super.execute()
        try! wrift.createFile(arguments.value)
    }
}
