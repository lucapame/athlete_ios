//
//  HoldDownButton.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 14/05/24.
//


import SwiftUI

struct IndicatorView: View {
    var progress: CGFloat
    
    let ringSize: CGFloat
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            
            // background
            Circle()
                .stroke(
                    Color.gray.opacity(0.3),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    
                )
                .frame(width: ringSize, height: ringSize)
            
            
            // progress
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.accentGreen,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    
                )
                .frame(width: ringSize, height: ringSize)
            
            
        }
        .rotationEffect(.degrees(-90))
    }
    
}

struct HoldDownButton<Content: View>: View{
    
    
    
    
    var action: () -> ()
     var content: Content
     var ringSize: CGFloat
     
     init(action: @escaping () -> (), ringSize: CGFloat = 30, @ViewBuilder content: () -> Content) {
         self.action = action
         self.ringSize = ringSize
         self.content = content()
     }
    
    @State var timerStart: Bool = false
    @State var actionPerformed: Bool = false
    
    
    let activeTime = 2.0
    @State var timeRemaining: CGFloat = .infinity
    
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
   
    private let lineWidth: CGFloat = 2
    
    
    var body: some View {
        ZStack {
            
            content
                .opacity(timerStart ? 0.6 : 1)
                .onLongPressGesture(minimumDuration: activeTime, perform: {
                    guard actionPerformed == false else {return}
                    timerStart = false
                    action()
                    actionPerformed = true
                }, onPressingChanged: { isPressing in
                    if timeRemaining < 0 {
                        return
                    }
                    if isPressing {
                        timerStart = true
                    } else {
                        timerStart = false
                        withAnimation {
                            timeRemaining = activeTime
                        }
                    }
                })
            
            IndicatorView(progress: (activeTime - timeRemaining) / activeTime, ringSize: ringSize, lineWidth: lineWidth)
        }
        .onReceive(timer, perform: { _ in
            if timerStart {
                if timeRemaining > 0 {
                    withAnimation {
                        timeRemaining = timeRemaining - 0.1
                    }
                }
            }
        })
        .onAppear {
            timeRemaining = activeTime
        }
    }
    
    func performAction() {
        print("Long press finished!")
        
    }
}

#Preview {
    HoldDownButton(action: {
        print("Button held down!")
    }, ringSize: 200) {
        Image(systemName: "pause.fill")
    }
}
