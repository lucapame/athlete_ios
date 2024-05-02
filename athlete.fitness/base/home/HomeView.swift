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
    @State private var showingProfileSheet = false
    @State private var isRefreshing = false // State to track refreshing
    

    
    var body: some View {
        GeometryReader {
            /// For Animation Purpose
            let size = $0.size
            NavigationStack {
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        
                        HStack(alignment: .top, spacing: 10) {
                            VStack(alignment: .leading, spacing: 5, content: {
                                HStack(content: {
                                    VStack(alignment: .leading, content: {
                                        Text("Hey, Luis!")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                        Text("Summary")
                                            .foregroundStyle(.gray.opacity(0.5))
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
                            .visualEffect { content, geometryProxy in
                                content
                                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
                            }
                            
                            Spacer(minLength: 0)
                            
                            
                        }
                        HStack{
                            Text("Today")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }.padding(.vertical)
                        
                   
                            DetailActivityCard(title:"Exercise Minutes", icon:"figure.run",headerColor: Color.accentGreen,destinationView: HomeView()){
                                HStack{
                                    Text("45 Min")
                                        .padding(3)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                
                            }
                            DetailActivityCard(title:"Calories", icon:"flame.fill",headerColor: Color.red,destinationView: HomeView()){
                                HStack(spacing: 0, content: {
                                    Text("1,323 Cal")
                                        .padding(3)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Spacer()
                                })
                                
                            }
                    
                      
                            HStack{
                                Text("Week Highlights")
                                    .font(.headline)
                                Spacer()
                                NavigationLink(destination: WorkoutDetails()) {
                                    Label("Workout Details", systemImage: "chevron.forward")
                                }.buttonStyle(PlainButtonStyle()).labelStyle(InvertedLabelStyle())
                             
                                
                            }.padding(.top)
                     
                     
                        WorkoutRutineCard()
                        
                        HStack{
                            Text("Week Highlights")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }.padding(.vertical)
                        
                        DetailActivityCard(title:"Workout Minutes", icon:"flame.fill",headerColor: Color.accentGreen,destinationView: HomeView()){
                            HStack{
                                SimpleWorkoutMinutesBarChart()
                            }.padding(.vertical)
                        }
                        
                        DetailActivityCard(title:"Latest Activities", icon:"figure.run",headerColor: Color.mint,destinationView: HomeView()){
                            VStack(spacing: 8, content: {
                                WorkoutRutineSmallCard()
                                WorkoutRutineSmallCard()
                                WorkoutRutineSmallCard()
                                WorkoutRutineSmallCard()
                            }).padding(.top)
                        }
                    } .refreshable {
                        // Functionality to perform when refreshing
                         refreshData()
                    }
                    
                }.padding(.horizontal)
                    .padding(.vertical,2)
                    .sheet(isPresented: $showingProfileSheet) {
                        SettignsView()
                    }
            }.accentColor(.accentGreen)
        }
        
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

func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
    let minY = proxy.frame(in: .scrollView).minY
    return minY > 0 ? 0 : (-minY / 15)
}

func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
    let minY = proxy.frame(in: .scrollView).minY
    let screenHeight = size.height
    
    let progress = minY / screenHeight
    let scale = (min(max(progress, 0), 1)) * 0.2
    
    return 1 + scale
}

#Preview {
    
    HomeView().environmentObject(AuthenticationViewModel())
    
    
}
