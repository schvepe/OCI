//
//  connect.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/7/19.
//  Copyright © 2019 Claudio Schweppe. All rights reserved.
//

import Foundation
import Cliboci
public class Connection {
    var envhpp:OpaquePointer?
    var srvhp:UnsafeMutableRawPointer?
    var errhp:UnsafeMutableRawPointer?
    var usrhp:UnsafeMutableRawPointer?
    var svchp:UnsafeMutableRawPointer?
    public  init() {
        
        let usrmempp = UnsafeMutablePointer<UnsafeMutableRawPointer?>.init(nil)

       
        Error.checkError(result: OCIEnvCreate(UnsafeMutablePointer(mutating: &envhpp),
                                              UInt32(OCI_DEFAULT),
                                              nil,
                                              nil,
                                              nil,
                                              nil,
                                              0,
                                              usrmempp))
       
        
       
       Error.checkError(result: OCIHandleAlloc(UnsafeRawPointer.init(envhpp),
                                               UnsafeMutablePointer(mutating:&errhp),
                                               UInt32(OCI_HTYPE_ERROR),
                                               0,
                                               usrmempp))
  
       Error.checkError(result: OCIHandleAlloc(UnsafeRawPointer.init(envhpp),
                                               UnsafeMutablePointer(mutating:&srvhp),
                                               UInt32(OCI_HTYPE_SERVER),
                                               0,
                                               usrmempp))
      Error.checkError(result:OCIHandleAlloc(UnsafeRawPointer.init(envhpp),
                                             UnsafeMutablePointer(mutating:&svchp),
                                             UInt32(OCI_HTYPE_SVCCTX),
                                             0,
                                             usrmempp))
      Error.checkError(result:OCIHandleAlloc(UnsafeRawPointer.init(envhpp),
                                             UnsafeMutablePointer(mutating:&usrhp),
                                             UInt32(OCI_HTYPE_SESSION),
                                             0,
                                             usrmempp))

        
    }
    
    public func logoff(){
        
        Error.checkError(result: OCILogoff (OpaquePointer(svchp),OpaquePointer(errhp) ))
    }
    public func connect (username:String, password:String,host:String, port:Int,serviceName:String){
        connect(username: username,
                   password: password,
                   in: makeTNS(host: host, port: port, SID: serviceName, serviceInsteadOfSid: false))
           
    }
    
    public func connect (username:String, password:String,host:String, port:Int,sid:String){
        
        connect(username: username,
                password: password,
                in: makeTNS(host: host, port: port, SID: sid, serviceInsteadOfSid: true))
    }
    
    public func connect(username:String, password:String, in server:String){
        
        
        Error.checkError(result: OCIServerAttach(OpaquePointer(srvhp) , OpaquePointer(errhp),server, Int32(server.count),UInt32(OCI_DEFAULT)));
        
        Error.checkError(result:OCIAttrSet(svchp, UInt32(OCI_HTYPE_SVCCTX), srvhp, 0, UInt32(OCI_ATTR_SERVER),OpaquePointer(errhp)))
        var buffer = username;
        Error.checkError(result: OCIAttrSet(usrhp, UInt32(OCI_HTYPE_SESSION), UnsafeMutableRawPointer(mutating: &buffer), UInt32(buffer.count), UInt32(OCI_ATTR_USERNAME),OpaquePointer(errhp)))
        
        var buffer1 = password;
        Error.checkError(result:OCIAttrSet(usrhp, UInt32(OCI_HTYPE_SESSION), UnsafeMutableRawPointer(mutating:  &buffer1), UInt32(buffer1.count), UInt32(OCI_ATTR_PASSWORD),OpaquePointer(errhp)))

      
        Error.checkError(result:OCISessionBegin(OpaquePointer(svchp), OpaquePointer(errhp), OpaquePointer(usrhp), UInt32(OCI_CRED_RDBMS), UInt32(OCI_DEFAULT)))
        
       
    }
    
    
    func makeTNS (host:String,port:Int,SID:String,serviceInsteadOfSid:Bool)->String{

     let teste = "SERVICE_NAME" //(serviceInsteadOfSid)?"SERVICE_NAME":"SID"
     return  "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=\(host))(PORT=\(port))))(CONNECT_DATA=(\(teste)=\(SID))))"

    }
    
    
    func close(){
        
        
    /*
        if (errhp !=  nil){
            Error.checkError(result: OCIHandleFree(errhp, UInt32(OCI_HTYPE_ERROR )))
        }*/
        
      
       
        
    }
    func commit(){
        
    }
    func rollback(){
        
    }
    func createStatement ()->Statement {
        
        return Statement(connection: self)
    }
    func preapareStatement() -> PreparedStatement{
        
        return PreparedStatement()
    }
    func prepareCall() -> CallableStatement{
        
        return CallableStatement();
    }
    
    func isClosed()->Bool {
        
        return true
    }
    func isReadOnly()->Bool {
        
        return true
    }
    deinit {
       
        if (svchp != nil){
                   Error.checkError(result: OCIHandleFree(svchp, UInt32(OCI_HTYPE_SVCCTX)))
            svchp = nil
        }
        if (srvhp != nil){
            Error.checkError(result:OCIHandleFree(srvhp, UInt32(OCI_HTYPE_SERVER)))
            srvhp = nil
        }
        if (errhp !=  nil){
            Error.checkError(result: OCIHandleFree(errhp, UInt32(OCI_HTYPE_ERROR )))
            errhp = nil
        }
       
        if (usrhp != nil){
            Error.checkError(result: OCIHandleFree(usrhp, UInt32(OCI_HTYPE_SESSION)))
            usrhp = nil
        }
       
        
       if (envhpp != nil){
                                print("before free envhpp address \(envhpp)")
                              
                                Error.checkError(result:OCIHandleFree(UnsafeMutableRawPointer(envhpp), UInt32(OCI_HTYPE_ENV  )))
                                envhpp = nil
                                print("after free envhpp address \(envhpp)")
              }
        
       
        Error.checkError(result:OCITerminate(UInt32(OCI_DEFAULT)))
        close()
    }
    
    func enableOutput(){
        
    }
   /* func createBlob(){
        
    }*/
}
