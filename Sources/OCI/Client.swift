//
//  Client.swift
//  OCI
//
//  Created by Claudio Schweppe on 11/12/19.
//

import Foundation
public class Client {
    func load(from path:String){
       let dictionary = ProcessInfo.processInfo.environment
        print(dictionary["DYLD_LIBRARY_PATH"])
    }
}
