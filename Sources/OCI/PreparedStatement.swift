//
//  PreparedStatement.swift
//  OCI
//
//  Created by Claudio Schvepe on 11/7/19.
//  Copyright © 2019 Claudio Schweppe. All rights reserved.
//

import Foundation
import Cliboci
class PreparedStatement{
    /*
       _ASSERTE(!m_sttmp);
    
        CHECK_INTERRUPT();
    
        m_text = sttm;
    
        CHECK_ALLOC(OCIHandleAlloc(GetOCIEnv(), (dvoid**)&m_sttmp, OCI_HTYPE_STMT, 0, 0));
        //8171  1315603 when fetching NULL data.
        //              ie: indp / rcodep may be incorrect.
        //              Workaround: Set OCI_ATTR_PREFETCH_ROWS to 0
        //              This problem was introduced in 8.1.6
        if (Connect::GetClientVersion() >= ecvClient9X)
            CHECK(OCIAttrSet(m_sttmp, OCI_HTYPE_STMT, &m_prefetch, 0, OCI_ATTR_PREFETCH_ROWS, GetOCIError()));
        CHECK(OCIStmtPrepare(m_sttmp, GetOCIError(), (oratext*)sttm, strlen(sttm), OCI_NTV_SYNTAX, OCI_DEFAULT));
*/
 }
