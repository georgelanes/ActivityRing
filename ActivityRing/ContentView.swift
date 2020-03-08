//
//  ContentView.swift
//  ActivityRing
//
//  Created by George Nascimento on 06/03/20.
//  Copyright © 2020 GLOBIT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView(.horizontal){
                HStack(spacing: 18, content: {
                    Spacer()
                    RingWeekDay(day:"S")
                    RingWeekDay(day:"T")
                    RingWeekDay(day:"Q")
                    RingWeekDay(day:"Q")
                    RingWeekDay(day:"S")
                    RingWeekDay(day:"S")
                    RingWeekDay(day:"D")
                    Spacer()
                })
                .frame(height: 100)
                .padding(.horizontal)
            }.padding(.horizontal)
            Spacer()
            HStack(alignment: .center){
                ZStack(alignment:.center, content: {
                    CustomActivityRing(radius:100,percent: 1.5,bgcolor: .red, color: .red,lineWidth:30)
                    CustomActivityRing(radius:68,percent: 0.9,bgcolor: .green, color: .green,lineWidth:30)
                    CustomActivityRing(radius:36,percent: 0.5,bgcolor: .blue, color: .blue,lineWidth:30)
                }).frame(width: 300, height: 300, alignment: .center)
            }
            .padding(100)
            Spacer()
        }
        .background(Color.black)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .environment(\.colorScheme, .dark)
        }
    }
}
#endif
