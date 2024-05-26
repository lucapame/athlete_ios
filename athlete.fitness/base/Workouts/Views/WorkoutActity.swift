//
//  WorkoutActity.swift
//  athlete.fitness
//
//  Created by Luis Parra on 09/05/24.
//

import SwiftUI
import AVKit
struct WorkoutActity: View {
    @State private var tabSelection = 1
    @State private var isPaused: Bool = false
    @State private var showingSheet: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 2, content: {
            TabView(selection: $tabSelection) {
                VStack(alignment: .leading, spacing:40,content: {
                    HStack(alignment: .center,content: {
                        Text("43").font(.system(size: 60, weight: .bold))
                        Text("ACTIVE\nKCAL ").font(.headline).foregroundStyle(.green)
                        Spacer()
                    })
                    
                    HStack(alignment: .center,content: {
                        Text("65").font(.system(size: 60, weight: .bold))
                        Text("TOTAL\nKCAL ").font(.headline).foregroundStyle(.orange)
                        
                    })
                    
                    HStack(alignment: .center,content: {
                        Text("43").font(.system(size: 60, weight: .bold))
                        Image(systemName: "heart.fill").font(.subheadline).symbolEffect(.pulse).foregroundStyle(.red)
                        
                    })
                    Spacer()
                    HStack(alignment: .center,spacing:10,content: {
                        VStack (alignment: .leading, spacing:2,content: {
                            Text("Weighted pull-ups").font(.largeTitle).fontWeight(.bold)
                            Text("2/23").foregroundStyle(.gray)
                        })
                        Spacer()
                        VStack(alignment: .center, spacing:0, content: {
                            Text("12").font(.largeTitle).bold()
                            Text("REPS").foregroundStyle(.red)
                        })
                    }).padding(.bottom,30)
                }).frame(width: .infinity).padding()
                    .tag(1)
                VStack(alignment: .leading, spacing:40,content: {
                    HStack(alignment: .center,content: {
                        Spacer()
                        HStack{
                            Text("43").font(.largeTitle).bold()
                            Image(systemName: "heart.fill").font(.subheadline).symbolEffect(.pulse).foregroundStyle(.red)
                        }
                        Spacer()
                        
                    })
                    VideoPlayer(player: AVPlayer(url: URL(string: "https://content.jwplatform.com/videos/hpG8HW01-f9Vyd3qF.mp4")!))
                        .frame(height: 215)
                        .cornerRadius(12)
                    HStack(alignment: .center,spacing:10,content: {
                        VStack (alignment: .leading, spacing:2,content: {
                            Text("Weighted pull-ups").font(.largeTitle).fontWeight(.bold)
                            Text("2/23").foregroundStyle(.gray)
                        })
                        Spacer()
                        VStack(alignment: .center, spacing:0, content: {
                            Text("12").font(.largeTitle).bold()
                            Text("REPS").foregroundStyle(.red)
                        })
                    }).padding(.bottom)
                }).frame(width: .infinity).padding()
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
            
            HStack{
                Text("03:54")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.yellow)
                Spacer()
                VStack(alignment: .leading,spacing: 0, content: {
                    Text("Next").font(.footnote)
                        .foregroundStyle(.accentPurple)
                    Text("Barbell military press")
                })
            }.padding(.horizontal)
                .padding(.bottom)
            
            HStack(alignment: .center,spacing: 45, content: {
                
                Button(action: {
                    showingSheet.toggle()
                }) {
                    VStack(alignment: .center, spacing: 1, content: {
                        Text("45")
                        Text("lb").font(.footnote).foregroundStyle(.red)
                    })
                    
                }
                .padding(.all)
                .frame(width: 75)
                .frame(height: 75)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(100)
                .buttonStyle(PlainButtonStyle())
                
                
                
                HoldDownButton(action: {
                    dismiss.callAsFunction()
                }, ringSize: 102) {
                    Button(action: {
                        isPaused.toggle()            }) {
                            Image(systemName: isPaused ? "play.fill": "pause.fill").font(.largeTitle)
                                .contentTransition(.symbolEffect(.replace.offUp.byLayer))
                        }
                        .padding(.all)
                        .frame(width: 100)
                        .frame(height: 100)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(100)
                        .buttonStyle(PlainButtonStyle())
                }
                
                
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Image(systemName: "chevron.forward")
                    
                }
                .padding(.all)
                .frame(width: 65)
                .frame(height: 65)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(100)
                .buttonStyle(PlainButtonStyle())
                
            }).padding()
        })  .sheet(isPresented: $showingSheet) {
            SheetView
        }
        
    }
    
    /// Sheet View
    @ViewBuilder
    var SheetView: some View {
        @State var weight = 78
        @State var scnWeight = 25
        @State var weightUnit = 1 // 0 for kg, 1 for lb
        @State var reps = 45
        
        VStack (spacing: 10, content: {
            Image(systemName: "dumbbell.fill").font(.largeTitle).foregroundStyle(.accent).padding(.bottom,30)
            Text("Weights & Reps").font(.largeTitle).bold()
            
            HStack(spacing: 20) {
                
                Picker("Weight", selection: $weight) {
                    ForEach(0 ..< 500) { weight in
                        Text("\(weight)")
                    }
                }
                .pickerStyle(.wheel)
                .clipped()
                
                Picker("dots", selection: $scnWeight) {
                    ForEach(Array(stride(from: 0, to: 100, by: 25)), id: \.self) { scnWeight in
                        Text(".\(scnWeight)")
                    }
                }
                
                .pickerStyle(.wheel)
                .clipped()
                
                Picker("Unit", selection: $weightUnit) {
                    Text("kg")
                    Text("lb")
                    
                }
                .pickerStyle(.wheel)
                .clipped()
                
                Text("x").font(.title)
                Picker("Reps", selection: $reps) {
                    ForEach(0 ..< 100) { reps in
                        Text("\(reps)")
                    }
                }
                .pickerStyle(.wheel)
                .clipped()
                
            }.padding(.horizontal)
            
            Text("Remember to listen to your body and stop if you experience any pain beyond normal muscle fatigue.").padding().multilineTextAlignment(.center).foregroundStyle(.gray).font(.footnote)
            
            
            
        }).padding(.all,20)
        Button(action: {
            showingSheet.toggle()
        }) {
            Label("Save & Continue", systemImage: "")
                .frame(maxWidth: .infinity)
                .labelStyle(.titleOnly)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
        }.buttonStyle(.borderedProminent)
            .tint(.accentGreen)
            .controlSize(.large).padding(.all,32)
        
    }
}

#Preview {
    WorkoutActity()
}
