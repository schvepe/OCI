//
//  Error.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/12/19.
//

import Foundation
import Cliboci
public class Error {
    
    public static func checkError(result status:Int32) {
        var  errbuf = UnsafeMutablePointer<UInt8>.allocate(capacity: 4000)
        var  buflen:UInt32
        let  errcode = UnsafeMutablePointer<Int32>.allocate(capacity:1)
        defer {
            errbuf.deallocate()
        }

        
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
      //  let result =  OCIErrorGet ( errhp,  1, nil, errcode,
        //              errbuf,250 ,UInt32( OCI_HTYPE_ERROR));
        
       /* print("Result \(result) \n");
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
        precondition(status==0,"checkError return \(status)")
    }
    
}
