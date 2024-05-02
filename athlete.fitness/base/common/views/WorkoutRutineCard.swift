//
//  WorkoutRutineCard.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//


import SwiftUI

struct WorkoutRutineCard: View {
    
    var body: some View {
        VStack(alignment: .leading,spacing: 3, content: {
            AsyncImage(url: URL(string: "https://cdn.centr.com/content/17000/16181/images/landscapewidemobile1x-centrpower---adv---p1w1w2w3d5---169---v2.jpg")){image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color(.systemBackground)
            }   .frame( minHeight: 235,maxHeight:240, alignment: .center)
            
            
            HStack(alignment: .top,content: {
                VStack(alignment: .leading, spacing: 12, content: {
                    
                    Text("Next level shoulders").font(.title).fontWeight(.bold)
                    
                    HStack(spacing: 3, content: {
                        Image(systemName: "clock.arrow.circlepath").foregroundColor(.orange).fontWeight(.bold).font(.callout)
                        Text("35 MIN").fontWeight(.bold).font(.callout).foregroundColor(.orange)
                    })
                    HStack(alignment: .bottom, spacing: 10,content: {
                        VStack(alignment: .leading, spacing: 2, content: {
                            HStack{
                                Image(systemName: "dumbbell").foregroundColor(.gray)
                                Text("EQUIPMENT").foregroundColor(.gray)
                                
                            }
                            Text("CABLE MACHINE•DUMBBELLS • EZY BAR • INCLINE BENCH")
                                .font(.caption)
                                .foregroundColor(.gray)
                        })
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Label("Start", systemImage: "figure.run")
                                .font(.title3)
                                .padding(5)
                        }.buttonStyle(.borderedProminent)
                            .tint(.accentGreen)
                            .foregroundColor(.black)
                            .controlSize(.regular)
                            .cornerRadius(12)
                        
                    })
                    
                    
                })
                Spacer()
                
            }).padding()
            
            
            
            
        })
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        
        
        
        
    }
}

#Preview {
    ScrollView {
        WorkoutRutineCard()
    }.padding()
}
