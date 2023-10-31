//
//  retrospectDataModel.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//

import Foundation

struct retrospectDataModel {
    var footMark: feel
    var retrospectTitleLabel: String
}

@frozen
enum feel {
    case good
    case bad
    var footMark: String {
        switch self {
        case .good:
            return "🐾"
        case .bad:
            return "🐾"
        }
    }
}
