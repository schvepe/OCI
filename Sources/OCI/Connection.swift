//
//  connect.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/7/19.
//  Copyright © 2019 Claudio Schweppe. All rights reserved.
//

import Foundation
import Cliboci
public class  Connection {
    let envhpp = UnsafeMutablePointer<OpaquePointer?>.init(bitPattern: 0)
    let srvhp  = OpaquePointer.init(bitPattern: 0)
    let errhp  = OpaquePointer.init(bitPattern: 0)
    let usrhp  = OpaquePointer.init(bitPattern: 0)
    let svchp  = OpaquePointer.init(bitPattern: 0)
    public  init() {
        
    
        let result =  OCIEnvCreate(envhpp,
                                     UInt32(OCI_THREADED),
                                     nil,
                                     nil,
                                     nil,
                                     nil,
                                     0,
                                     nil)
        print(result)
          if (result == 0) {
             print("oi")
          }
       print("oi")
     
    }
    
    public func logoff(){
        
        checkError(result: OCILogoff (svchp,errhp ))
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
        
        checkError(result: OCIServerAttach(srvhp , errhp,server, Int32(server.count),UInt32(OCI_DEFAULT)));
        
       // checkError(result: OCIAttrSet(UnsafeMutableRawPointer(srvhp), UInt32(OCI_HTYPE_SESSION), UnsafeMutableRawPointer(mutating: &username), UInt32(username.count), UInt32(OCI_ATTR_USERNAME),errhp))
        
      
    //    checkError(result:OCIAttrSet(srvhp, UInt32(OCI_HTYPE_SESSION), UnsafeMutableRawPointer(mutating:  &password), UInt32(password.count), UInt32(OCI_ATTR_PASSWORD),errhp))

      
        checkError(result:OCISessionBegin(svchp, errhp, usrhp, UInt32(OCI_CRED_RDBMS), UInt32(OCI_DEFAULT)))
        
       
    }
    
    
    func makeTNS (host:String,port:Int,SID:String,serviceInsteadOfSid:Bool)->String{

     let teste = "SERVICE_NAME" //(serviceInsteadOfSid)?"SERVICE_NAME":"SID"
     return  "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=\(host))(PORT=\(port))))(CONNECT_DATA=(\(teste)=\(SID))))"

    }
    
    public func checkError(result status:Int32) {
        var  errbuf = UnsafeMutablePointer<UInt8>.allocate(capacity: 4000)
        var  buflen:UInt32
        let  errcode = UnsafeMutablePointer<Int32>.allocate(capacity:1)
        defer {
            errbuf.deallocate()
        }
     print(status)
      switch (status) {
      case OCI_SUCCESS:
        break;
      case OCI_SUCCESS_WITH_INFO:
        print("Error - OCI_SUCCESS_WITH_INFO\n");
        break;
      case OCI_NEED_DATA:
        print("Error - OCI_NEED_DATA\n");
        break;
      case OCI_NO_DATA:
        print("Error - OCI_NO_DATA\n");
        break;
      case OCI_ERROR:
       /* let result =  OCIErrorGet ( errhp,  1, nil, errcode,
                      errbuf,250 ,UInt32( OCI_HTYPE_ERROR));
        
        print("Result \(result) \n");
        print("Error -errcode \(errcode.pointee) \n");*/
        let t =  String(cString:errbuf)
     
        print("Error - \(t) \n");
        break;
      case OCI_INVALID_HANDLE:
        print("Error - OCI_INVALID_HANDLE\n");
        break;
      case OCI_STILL_EXECUTING:
        print("Error - OCI_STILL_EXECUTE\n");
        break;
      case OCI_CONTINUE:
        print("Error - OCI_CONTINUE\n");
        break;
      default:
        break;
      }
    }
    
    func close(){
        
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
    func deint(){
         close()
    }
    
    func enableOutput(){
        
    }
   /* func createBlob(){
        
    }*/
}
