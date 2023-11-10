//
//  retrospectDataModel.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//
import Foundation
import UIKit

struct retrospectDataModel {
    var feeling: EventType
    var retrospectTitleLabel: String
    var writeDate: DateComponents
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
        return [retrospectDataModel(feeling: .good, retrospectTitleLabel: "Hello World!", writeDate: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day: 25)),
                retrospectDataModel(feeling: .bad, retrospectTitleLabel: "ino!", writeDate: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day: 1)),
                retrospectDataModel(feeling: .bad, retrospectTitleLabel: "shinyoung!", writeDate: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day: 10)),
                retrospectDataModel(feeling: .good, retrospectTitleLabel: "seonguen!", writeDate: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day: 11)),
                retrospectDataModel(feeling: .good, retrospectTitleLabel: "hyeonryeol!", writeDate: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day: 17))]
    }
}
