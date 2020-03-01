//
//  Profile.swift
//  LandMarks
//
//  Created by zl jiao on 2020/3/1.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    
    static let `default` = Self(username: "Jiaozl")
    
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌹"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "⛄️"
     }
}
