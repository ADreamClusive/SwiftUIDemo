//
//  Badge.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/29.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI

struct Badge: View {
    
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        
        ForEach(0..<Badge.rotationCount, content: { i in
            RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0)
        })
        .opacity(0.5)
        
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(0.25, anchor: .top)
                    .position(x: geometry.size.width * 0.5, y: 0.75 * geometry.size.height)
            }
        }
    .scaledToFit()
        
    }

    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
