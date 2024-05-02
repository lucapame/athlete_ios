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
            
            GeometryReader{reader in
            
                AsyncImage(url: URL(string: "https://cdn.centr.com/content/17000/16181/images/landscapewidemobile3x-centrpower---adv---p1w1w2w3d5---169---v2.jpg")) { image in
                    GeometryReader { reader in
                        ZStack {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 550)
                                .clipped()
                            
                        }
                    }
                } placeholder: {
                    Color(.systemBackground)
                } 
            }
            // default frame...
            .frame(height: 400)
            
            VStack(alignment: .leading,spacing: 15){
                
                Text("Next level shoulders")
                    .font(.system(size: 35, weight: .bold))

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
                })
                
               
                
       
                    
                Button(action: {
                    
                }) {
                    Label("Start Workout", systemImage: "figure.run")
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                }.buttonStyle(.borderedProminent).tint(.accentGreen)
                    .foregroundColor(.black)
                
                    .padding(.bottom)
                    .controlSize(.large)
                    .padding(.top)
                        
                Text("This workout requires good techique and precise movments. Work up a sweat to build serious size and strength in your deltoids.").foregroundColor(.gray)
                    
              
            }
        
            .padding(.top)
            .padding(.horizontal)
            .background(Color(.systemBackground))
            .padding(.bottom)
   
     
         
       
        })
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {
                
                }, label: {
                    Image(systemName: "ellipsis.circle.fill")
                })
            }}
        .edgesIgnoringSafeArea(.all)
       
    
    }

}

#Preview {
NavigationView {
        WorkoutDetails()
    }
}
