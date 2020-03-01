//
//  RotatedBadgeSymbol.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/29.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
