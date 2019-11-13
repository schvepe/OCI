//
//  Variable.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/12/19.
//

import Foundation
import Cliboci
class Variable {
    var type:sb4
    var indicator:sb2
    var size:sb4
    var bufferSize:sb4
    var buffer:char []
    init(type paramType:Int32, size paramSize:Int32){
        self.type = paramType
        self.size = paramSize
        self.bufferSize = paramSize
        self.indicator = OCI_IND_NULL
        self.buffer
       
    }
    
}
