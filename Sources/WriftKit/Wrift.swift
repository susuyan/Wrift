import Foundation
import PathKit
import Rainbow
import SwiftCLI
import Files

public class Wrift {

    public var path: Path
    public var linkPath: Path

    public var standardOut: WritableStream
    public var standardError: WritableStream
    
    public var verbose = false

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

    
    public func createFile(_ params:[String]) throws  {
        
        guard params.count > 0 else {
            let error = WriftError.failure("没有文件")
            throw error
        }
        
        let filePath = params[0]
        let title = params[1]
        let date = Date.now()

        let body = [
            "---",
            "date: \"\(date)\"",
            "title: \"\(title)\"",
            "permalink:\"\(date)-\(filePath)\"",
            "---"]
        
       
        let floder =  Folder.current
        let file =  try! floder.createFile(named: "\(filePath).md")                
     
        var s = ""
        let _ = body.forEach{s += ($0 + "\n")}

        do {
            try! file.write(s)
        }

        output("🌱 \(file.path)")
        
      
        
        

    }
}
