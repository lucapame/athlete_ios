//
//  ExerciseView.swift
//  athlete.fitness
//
//  Created by Luis Parra on 07/05/24.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var isPlaying = false
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            AsyncImage(url: URL(string: "https://cdn.centr.com/content/15000/14403/images/landmob-cp---ezy-bar-skull-crushers---169.jpg")) { image in
                
                ZStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                
            } placeholder: {
                Color(.systemBackground)
            }.frame( minHeight: 320, maxHeight: 320, alignment: .center)
                .cornerRadius(12)
            
            LazyVStack(alignment: .leading, spacing: 0) {
                Section{
                    Text("EZ-Bar Skullcrusher")
                        .font(.largeTitle).fontWeight(.bold)
                        .controlSize(.large)
                    
                    Label("TRICEPS", systemImage: "figure.cooldown")
                        .labelStyle(.titleOnly)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom,33)
                }
                Section {
                    DetailActivityCard(title:"Weight Progress", icon:"figure.strengthtraining.traditional",headerColor:.primary,destinationView: DummyHelper()){
                        HStack{
                            WeightLiftingChartView()
                        }.padding(.vertical,33)
                    }
                    
                }
                Section {
                    Text("Using a close grip, lift the EZ bar and hold it with your elbows in as you lie on the bench. Your arms should be perpendicular to the floor. This will be your starting position. Keeping the upper arms stationary, lower the bar by allowing the elbows to flex. Inhale as you perform this portion of the movement. Pause once the bar is directly above the forehead. Lift the bar back to the starting position by extending the elbow and exhaling. Repeat."
                    ).foregroundColor(.gray).padding(.bottom,33)
                } header: {
                    
                    Text("Show me how")
                        .font(.headline)
                        .frame(width: 600, height: 20, alignment: .leading).padding(.bottom,8).padding(.top,33)
                    
                }
                
                
                
                Section {
                          ZStack {
                              VideoPlayer(player: AVPlayer(url: URL(string: "https://content.jwplatform.com/videos/hpG8HW01-f9Vyd3qF.mp4")!))
                                  .frame(height: 200)
                                  .cornerRadius(12)
                                  .padding(.vertical)
                                  .onAppear {
                                      NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                                          isPlaying = false
                                      }
                                  }
                              
                              if !isPlaying {
                                  Button(action: {
                                      isPlaying = true
                               
                                  }) {
                                      Image(systemName: "play.fill")
                                          .font(.system(size: 50))
                                          .foregroundColor(.white)
                                  }
                              }
                          }
                      }
                
                
                Section {
                    Text("Usign the perfect wegiht is key, be aware on your capabilities and be careful to avoid injuries"
                    ).foregroundColor(.gray).padding(.bottom,33)
                } header: {
                    
                    Text("Pro Tip")
                        .font(.headline)
                        .frame(width: 600, height: 20, alignment: .leading).padding(.bottom,8).padding(.top,22)
                }
                
                
                
            }
            
            
            .padding(.horizontal)
            .background(Color(.systemBackground))
            .padding(.bottom)
            
        })
        .ignoresSafeArea(.all)
        
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis.circle.fill")
                })
            }}
        
        
    }
    
}

#Preview {
    NavigationView {
        ExerciseView()
    }   .accentColor(.accentGreen)
}
