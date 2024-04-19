//
//  UserData.swift
//  FortuneTellingJapanApp
//
//  Created by Gomi Kouki on 2024/04/17.
//

import Foundation

//年月日を格納する構造体
struct DateInfo: Codable {
    var year: Int
    var month: Int
    var day: Int
}

struct MonthDay: Codable {
    var month: Int
    var day: Int
}

//ユーザの情報を格納する構造体
struct User: Codable {
    var name: String
    var birthday: DateInfo
    var blood_type: String
    var today: DateInfo
}

struct Prefecture: Decodable {
    var name: String
    var capital: String
    var citizen_day: MonthDay
    var has_coast_line: Bool
    var logo_url: String
    var brief: String
}
