//
//  DetailActivityCard.swift
//  athlete.fitness
//
//  Created by Luis Parra on 28/04/24.
//

import SwiftUI

struct DetailActivityCard<Content: View, Destination: View>: View {
    let title: String
    let icon: String
    let headerColor: Color?
    let showCta: Bool?
    let destinationView: Destination?
    let content: Content
    
    init(title: String, icon: String,headerColor:Color, showCta: Bool? = true, destinationView: Destination? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.headerColor = headerColor
        self.showCta = showCta
        self.content = content()
        self.destinationView = destinationView
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(  Color(.secondarySystemBackground))
            
            VStack {
                HStack {
                    HStack{
                        Image(systemName: icon)
                        Text(title)
                            .font(.callout)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    }
                    .foregroundColor(headerColor)
                    Spacer()
                    if(showCta! && destinationView != nil){
                        NavigationLink(destination: destinationView) {
                            Label("See more", systemImage: "chevron.forward")
                        }.buttonStyle(PlainButtonStyle()).labelStyle(InvertedLabelStyle())
                        
                    }
                    
                }
                // You can add any additional content or modifiers here
                VStack{
                    content
                }
                
                
            }
            .padding([.horizontal], 15)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    ScrollView {
        DetailActivityCard(title:"Calories", icon:"flame.fill",headerColor: Color.red, destinationView:HomeView()){
            HStack{
                Text("1,323 Cal")
                    .padding()
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            
        }
    }
    
}
