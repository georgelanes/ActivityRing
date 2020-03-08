//
//  CustomActivityRing.swift
//  ActivityRing
//
//  Created by George Nascimento on 07/03/20.
//  Copyright © 2020 GLOBIT. All rights reserved.
//

import SwiftUI

struct CustomActivityRing: View {
    // Variables
    var radius: CGFloat
    var percent: CGFloat
    var bgcolor: Color = .gray
    var color: Color = .red
    var lineWidth: CGFloat = 30
    var animationDuration: Double = 0.5
    
    // States
    @State var trimRing = false
    @State private var trimOverlapping = false
    
    // functions
    
    internal var primaryPercent: CGFloat {
        return self.percent < 1.0 ? self.percent : 1.0
    }
    
    internal var secondaryPercent: CGFloat {
        return self.percent < 1.0 ? 0.0 : self.percent.truncatingRemainder(dividingBy: 1.0)
    }
    
    internal var primaryDuration: Double {
        return Double(primaryPercent / percent) * animationDuration
    }
    
    internal var secundaryDuration: Double {
        return Double(animationDuration) - primaryDuration
    }

    // internal private struct
    
    private struct OverlappingRing: View {
        var radius: CGFloat
        var color: Color = .red
        var ringWidth: CGFloat = 30.0
        var duration: Double
        var delayDuration: Double
        
        
        @State private var trimRing = false
        
        var body : some View {
            
            Circle()
                .trim(from:0, to: self.trimRing ? 0.005 : 0)
                .stroke(color, style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round, lineJoin: .round))
            .frame(width:radius*2, height: radius*2)
            .rotationEffect(.degrees(-90))
            .animation(Animation.linear(duration: self.delayDuration))
            .onAppear{
                self.trimRing.toggle()
            }
        }
        
    }
    
    
    
    var body: some View {
        ZStack{

            Circle()
                .stroke(bgcolor,style:StrokeStyle(lineWidth: self.lineWidth))
                .frame(width:radius*2, height: radius*2)
                .opacity(0.2)
            
            Circle()
                .trim(from:0, to: self.trimRing ? self.primaryPercent : 0)
                .stroke(color, style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
                .frame(width:radius*2, height: radius*2)
                .rotationEffect(.degrees(-90))
                .animation(Animation.linear(duration: self.primaryDuration))
                .onAppear{
                    self.trimRing.toggle()
                }
            
            if percent > 1.0 {
                OverlappingRing(radius:self.radius, color:self.color, ringWidth: lineWidth, duration: secundaryDuration, delayDuration:primaryDuration)
                    .shadow(color: .black, radius:  0, x: 1, y: 0)
                    .rotationEffect(.degrees(self.trimOverlapping ? Double(self.secondaryPercent * 360) : 0))
                    .animation(Animation.linear(duration: self.secundaryDuration).delay(self.primaryDuration))
                    .onAppear{
                        self.trimOverlapping.toggle()
                    }
                
            }
            
        }
    }
}

struct CustomActivityRing_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CustomActivityRing(radius:150,percent: 0.9,bgcolor: .red, color: .red)
            CustomActivityRing(radius:118,percent: 0.6,bgcolor: .green, color: .green)
            CustomActivityRing(radius:86,percent: 0.5,bgcolor: .blue, color: .blue)
        }
    }
}
