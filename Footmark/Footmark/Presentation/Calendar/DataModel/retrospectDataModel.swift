//
//  retrospectDataModel.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//

import Foundation
import UIKit

struct retrospectDataModel {
    let feeling: EventType
    var retrospectTitleLabel: String
}

@frozen
enum EventType {
    case good
    case bad
    
    var image: UIImage {
        switch self {
        case .bad:
            return UIImage(systemName: "pawprint.fill")!.withTintColor(UIColor(hex: "F9ACAC"))
        case .good:
            return UIImage(systemName: "pawprint")!.withTintColor(UIColor(hex: "B9CDF7"))
        }
    }
}

extension retrospectDataModel {
    
    static func dummy() -> [retrospectDataModel] {
        return [retrospectDataModel(feeling: .good, retrospectTitleLabel: "Hello World!"),
                retrospectDataModel(feeling: .bad, retrospectTitleLabel: "ino!"),
                retrospectDataModel(feeling: .bad, retrospectTitleLabel: "shinyoung!"),
                retrospectDataModel(feeling: .good, retrospectTitleLabel: "seonguen!"),
                retrospectDataModel(feeling: .good, retrospectTitleLabel: "hyeonryeol!")]
    }
}
