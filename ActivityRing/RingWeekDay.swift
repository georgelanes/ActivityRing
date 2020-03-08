//
//  RingWeekDay.swift
//  ActivityRing
//
//  Created by George Nascimento on 07/03/20.
//  Copyright © 2020 GLOBIT. All rights reserved.
//

import SwiftUI

struct RingWeekDay: View {
    var day: String
    
    internal var randomPercent : CGFloat {
        return CGFloat.random(in: 0..<1.5)
    }
    
    var body: some View {
        ZStack{
            Text(day)
            CustomActivityRing(radius:30, percent: randomPercent,bgcolor: .red, color: .red, lineWidth:8)
            CustomActivityRing(radius:20, percent: randomPercent,bgcolor: .green, color: .green, lineWidth:8)
            CustomActivityRing(radius:13, percent: randomPercent,bgcolor: .blue, color: .blue, lineWidth:8)

        }
    }
}

struct RingWeekDay_Previews: PreviewProvider {
    static var previews: some View {
        RingWeekDay(day: "S")
    }
}
