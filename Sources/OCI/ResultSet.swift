//
//  ResultSet.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/7/19.
//  Copyright © 2019 Claudio Schweppe. All rights reserved.
//

import Foundation

public class ResultSet/*: IteratorProtocol*/ {
    //public typealias Element = Row
    


   // let statemet:Statement
   // var data:UnsafeMutableRawBufferPointer;
   // var column: [String: Column]
     
    public init(statemet statemetParam:Statement){
       // self.statemet = statemetParam
     
    }
    //public typealias Element = Array
    
    
    

    public func next()->Row? {
      
    /*    sword OCIStmtFetch2 ( statemet.stmthp,
        OCIError    *errhp,
        ub4          nrows,
        ub2          orientation,
        sb4          fetchOffset,
        ub4          mode );*/
      
        return Row()
    }
    
   
    
}
/*
  for client in clientResult {
    client.getString("Name")
    client.getInt("1")
 
 }
 */
