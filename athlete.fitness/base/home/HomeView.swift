//
//  HomeView.swift
//  athlete.fitness
//
//  Created by Luis Parra on 26/04/24.
//

import SwiftUI



struct HomeView: View {
    
    @AppStorage("userName") private var userName: String = ""
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    @State private var showingProfileSheet: Bool = false
    @State private var isRefreshing = false // State to track refreshing
    
    
    /// For Animation
    @Namespace private var animation
    var body: some View {
        GeometryReader {
            /// For Animation Purpose
            let size = $0.size
            
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 20, content: {
                            HStack{
                                Text("Summary")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                            
                            HStack{
                                DetailActivityCard(title:"Workout", icon:"figure.run",headerColor: Color.accentGreen,showCta:false,destinationView: HomeView()){
                                    HStack{
                                        Text("45 Min")
                                            .padding(3)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    
                                }
                                DetailActivityCard(title:"Calories", icon:"flame.fill",headerColor: Color.red,showCta:false,destinationView: HomeView()){
                                    HStack(spacing: 0, content: {
                                        Text("1,323 Cal")
                                            .padding(3)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Spacer()
                                    })
                                    
                                }
                            }
                            
                            WorkoutRutineCard()
                            
                            HStack{
                                Text("Week Highlights")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                            
                            DetailActivityCard(title:"Workout Minutes", icon:"figure.strengthtraining.traditional",headerColor: Color.accentGreen,destinationView: HomeView()){
                                HStack{
                                    SimpleWorkoutMinutesBarChart()
                                }
                            }
                            
                            DetailActivityCard(title:"Latest Activities", icon:"figure.run",headerColor: Color.mint,destinationView: HomeView()){
                                VStack(spacing: 12, content: {
                                    WorkoutRutineSmallCard()
                                    WorkoutRutineSmallCard()
                                    WorkoutRutineSmallCard()
                                    WorkoutRutineSmallCard()
                                }).padding(.top)
                            }
                        })
                    } header: {
                        HeaderView(size)
                    }
                    .refreshable {
                        // Functionality to perform when refreshing
                        
                    }
                }
                .sheet(isPresented: $showingProfileSheet) {
                    SettignsView()
                }
                .padding(12)
            }
            
        }
        
        
    }
    
    /// Header View
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5, content: {
                HStack(content: {
                    
                    VStack(alignment: .leading, content: {
                        Text("Hey, Luis!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    })
                    Spacer()
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        Image(systemName: "figure.run.square.stack")
                            .font(.system(size: 45 * 0.4))
                    }
                    .padding(0)
                    .frame(width: 44, height: 44, alignment: .center)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(51)
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        showingProfileSheet = !showingProfileSheet
                    }) {
                        AvatarView(userName: "Luis Parra", size: 45)
                    }.buttonStyle(PlainButtonStyle())
                })
            })
            
            Spacer(minLength: 0)
            
        }
        .padding(.bottom)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(.systemBackground))
                    .blur(radius: 5)
                
            }
            
            .padding(.horizontal, -15)
            .padding(.top, -(safeArea.top + 15))
            
        }.accentColor(.accentGreen)
    }
    
    // Function to perform when refreshing
    @MainActor func refreshData() {
        // Perform data refreshing here
        
        // Simulate refreshing with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isRefreshing = false // Finish refreshing
        }
    }
    
}




#Preview {
    NavigationView{
        HomeView().environmentObject(AuthenticationViewModel())
    }.accentColor(.accentGreen)
    
}
