//
//  SuperheroView.swift
//  SuperHeros
//
//  Created by mohamdan on 27/05/2023.
//

import SwiftUI

struct SuperheroView: View {
    
    var superH : Superhero
    @State var isScaling : Bool = false
    @State var isSliding : Bool = false
    @State var isPresentAlert : Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    //var gradient : [Color] = [Color("colorHulk01"), Color("colorHulk02")]
    
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 1), value: isScaling)
            VStack{
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button {
                    isPresentAlert.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack{
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    }//:Hstack
                    .padding()
                    .font(.title2)
                    .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isPresentAlert){ Alert(title: Text ("More about \(superH.title)"), message: Text (superH.message), dismissButton : .default(Text ("OK")))
                    }//:Alert
                }//:label

                
            }//:vstack
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 1), value: isSliding)
            
            
        }//:z stack
        .frame(width: 350, height: 545, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color:.black, radius: 2, x:2, y: 2)
        .onAppear{
            isScaling = true
            isSliding = true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[1])
    }
}
