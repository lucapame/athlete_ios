//
//  WorkoutDetails.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//

import SwiftUI

struct WorkoutDetails: View {
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            AsyncImage(url: URL(string: "https://cdn.centr.com/content/17000/16181/images/landscapewidemobile3x-centrpower---adv---p1w1w2w3d5---169---v2.jpg")) { image in
                
                ZStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                
            } placeholder: {
                Color(.systemBackground)
            }.frame( minHeight: 400, alignment: .center)
                .cornerRadius(12)
            
            
            
            LazyVStack(alignment: .leading, spacing: 0) {
                
                Section{
                    Text("Next level shoulders")
                        .font(.largeTitle).fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 2, content: {
                        HStack{
                            Image(systemName: "dumbbell").foregroundColor(.gray)
                            Text("EQUIPMENT").foregroundColor(.gray)
                            
                        }
                        Text("CABLE MACHINE•DUMBBELLS • EZY BAR • INCLINE BENCH")
                            .font(.caption)
                            .foregroundColor(.gray)
                    })
                    
                    HStack(spacing: 3, content: {
                        Image(systemName: "clock.arrow.circlepath").foregroundColor(.orange).fontWeight(.bold).font(.callout)
                        Text("35 MIN").fontWeight(.bold).font(.callout).foregroundColor(.orange)
                    }).padding(.top)
                    NavigationLink(destination: WorkoutActity()) {
                        Label("Start Workout", systemImage: "figure.run")
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                    }.buttonStyle(.borderedProminent).tint(.accentGreen)
                        .foregroundColor(.black)
                    
                 
                        .controlSize(.large)
                        .padding(.top)
                    Divider().padding(.vertical)
                    Text("This workout requires good techique and precise movments. Work up a sweat to build serious size and strength in your deltoids.").foregroundColor(.gray)
                    Divider().padding(.vertical)
                }
                
                
              
                
                Section {
                    VStack{
                        ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView()); ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());
                        ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());  ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());
                    }.padding(.vertical)
                } header: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Get in the zone")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 600, height: 20, alignment: .leading)
                        
                        Text("Find your intensity and get your chest ready to work.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Label("Warm Up", systemImage: "figure.cooldown")
                            .labelStyle(.titleOnly)
                            .padding(.vertical,4)
                            .padding(.horizontal,7)
                            .font(.caption)
                            .background(Color.accentPurple, in: RoundedRectangle(cornerRadius: 45))
                            .foregroundStyle(.white)
                        
                        
                    })
                    
                }
                
                Section {
                    VStack{
                        ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView()); ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());
                        ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());  ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:  ExerciseView());
                    }
                } header: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Power up")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 600, height: 20, alignment: .leading)
                        
                        Text("Get ready to hit your upper pecs and triceps.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Label("Round 1", systemImage: "figure.cooldown")
                            .labelStyle(.titleOnly)
                            .padding(.vertical,4)
                            .padding(.horizontal,7)
                            .font(.caption)
                            .background(Color.accentPurple, in: RoundedRectangle(cornerRadius: 45))
                            .foregroundStyle(.white)
                        
                        
                    }).padding(.vertical,20)
                    
                }
            }
            
            
            .padding(.horizontal)
            .background(Color(.systemBackground))
            .padding(.bottom)
            
            
            
            
        })  .ignoresSafeArea(.all)
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
        WorkoutDetails()
    }   .accentColor(.accentGreen)
}
