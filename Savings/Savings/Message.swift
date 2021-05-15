//
//  Currency.swift
//  Savings
//
//  Created by Kat Ou on 18.01.2021.
//

import Foundation

struct Message: Codable {
    var success: Bool = true
    var terms: String = ""
    var privacy: String = ""
    var timestamp: Int = 0
    var source: Currency = .USD
    var quotes: Quotes = Quotes()
    struct Quotes: Codable {
        var USDEUR: Double = 0
        var USDRUB: Double = 0
    }
}
