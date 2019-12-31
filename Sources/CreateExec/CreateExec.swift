//
//  CreateExec.swift
//  
//
//  Created by 张行 on 2019/12/31.
//

import Foundation
import Swiftline
import SwiftShell
import Mustache

enum CEError: Error {
    case custom(String)
    var localizedDescription: String {
        switch self {
        case .custom(let message):
            return "[Error]: \(message)"
        }
    }
}

class CreateExec {
    func create() throws {
        guard let pwd = main.env["PWD"] else {
            throw CEError.custom("Could not find the current path")
        }
        let commandName = ask("Please enter the name of the command")
        let commandDir = "\(pwd)/\(commandName)"
        guard !FileManager.default.fileExists(atPath: commandDir) else {
            throw CEError.custom("The \(commandDir) folder already exists")
        }
        try FileManager.default.createDirectory(atPath: commandDir, withIntermediateDirectories: true, attributes: nil)
        main.currentdirectory = commandDir
        try runAndPrint("swift", "package", "init", "--name", commandName, "--type", "executable")
        let packageFile = "\(commandDir)/Package.swift"
        let context:[String:Any] = [
            "name" : commandName,
            "dependencies" : [
                [
                    "libName" : "Swiftline",
                    "url" : "https://github.com/JoserccCLI/Swiftline",
                    "from" : "0.6.0"
                ],
                [
                    "libName" : "Commander",
                    "url" : "https://github.com/kylef/Commander",
                    "from" : "0.9.1"
                ],
                [
                    "libName" : "SwiftShell",
                    "url" : "https://github.com/kareman/SwiftShell",
                    "from" : "5.0.1"
                ],
            ]
        ]
        let template = try Template(string: packageMuache)
        let packageContent = try template.render(context)
        try packageContent.write(toFile: packageFile, atomically: true, encoding: .utf8)
        try runAndPrint("open", packageFile, "-a", "Xcode")
    }
}
