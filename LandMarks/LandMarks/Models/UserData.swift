//
//  UserData.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/29.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
