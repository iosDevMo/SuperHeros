//
//  SuperheroView.swift
//  SuperHeros
//
//  Created by mohamdan on 27/05/2023.
//

import SwiftUI

struct SuperheroView: View {
    var gradient : [Color] = [Color("colorHulk01"), Color("colorHulk02")]
    @State var isPresentAlert : Bool = false
    
    var body: some View {
        ZStack {
            Image("hulk")
                .resizable()
                .scaledToFit()
            VStack{
                Text("Hulk")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button {
                    isPresentAlert.toggle()
                } label: {
                    HStack{
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    }//:Hstack
                    .padding()
                    .font(.title2)
                    .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isPresentAlert){ Alert(title: Text ("More about Hulk"), message: Text ("Hulk is very green"), dismissButton : .default(Text ("OK")))
                    }//:Alert
                }//:label

                
            }//:vstack
            .offset(x: 0, y: 150)
            
            
        }//:z stack
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color:.black, radius: 2, x:2, y: 2)
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView()
    }
}
