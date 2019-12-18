//
//  File.swift
//  
//
//  Created by sanmy on 2019/12/18.
//

import Foundation
import WriftKit
import PathKit
import SwiftCLI

class NewCommand: WriftCommand {

    init(wrift: Wrift) {
        super.init(wrift: wrift, name: "new", description: "create new file")
    }

    
    override func execute() throws {
        try super.execute()
        wrift.newFile()
    }
    
}
