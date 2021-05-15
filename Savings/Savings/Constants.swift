//
//  Constants.swift
//  Savings
//
//  Created by Kat Ou on 16.01.2021.
//

import Foundation

struct Design {
    struct Colors {
        static let beauBlue = (188, 212, 230)
        static let midleBlueGreen = (132, 220, 198)
        static let mauvelous = (255, 159, 178)
        static let spaceCadet = (21, 30, 63)
        static let charcoal = (54, 73, 88)
        static let pinkLavander = (222, 186, 206)
        static let powderBlue = (169, 218, 216)
        static let canary = (253, 255, 182)
    }
}

struct NetWork {
    static let accessKey = "1b7114bcc7d82b0a3dbb0a1a31455582"
    
    enum LoadingState {
        case loading, loaded, failed
    }
}

struct Constants {
    static let fileName = "savings"
}

enum Currency: String, Codable, Equatable, CaseIterable {
    case EUR
    case USD
    case RUB
    
}


extension Double {
    var description: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "FR_fr")
        
        return formatter.string(for: self) ?? "lol"
    }
}

extension Date {
    var formatedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return formatter.string(for: self) ?? "lol"
    }
}
