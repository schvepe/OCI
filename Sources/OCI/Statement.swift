//
//  Statement.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/7/19.
//  Copyright © 2019 Claudio Schweppe. All rights reserved.
//

import Foundation
import Cliboci
public class Statement{

    let connection:Connection
    let stmthp = OpaquePointer.init(bitPattern: 0)
    
    public init(connection:Connection){
        self.connection = connection
        
    }
    func executeQuery(sql:String)->ResultSet{
        
    /*    Connection.checkError(result:OCIStmtPrepare2 ( connection.svchp,stmthp,connection.errhp,
        
        sql,
        sql.count,
        nil,
        0,
        OCI_NTV_SYNTAX,
        OCI_DEFAULT )*/
        
       // Connection.checkError(result: OCIStmtExecute(svchp, stmthp, errhp, 0, 0, 0, 0, OCI_DEFAULT))
            
        return ResultSet(statemet: self)
    }
    
    func define(at index:Int){
        
    }
    func define(name index:String){
        
    }
    
    func bind(at index:Int){
        
    }
    func bind(name index:String){
        
    }
    
    func executeUpdate()->Int{
        return 0
    }
    
    func close(){
        
    }
}
