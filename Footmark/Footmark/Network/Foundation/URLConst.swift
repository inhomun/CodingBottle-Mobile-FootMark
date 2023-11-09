//
//  URLConst.swift
//  Footmark
//
//  Created by 박신영 on 11/9/23.
//

import Foundation

struct APIConstants {
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
}

extension APIConstants {
    
    static var defaultHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
}
