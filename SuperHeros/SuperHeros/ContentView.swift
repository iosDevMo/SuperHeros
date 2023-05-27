//
//  ContentView.swift
//  SuperHeros
//
//  Created by mohamdan on 27/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    var superheros : [Superhero] = superherosData
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(superheros) { item in
                    SuperheroView(superH: item)
                }
                
            }//:Hstack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
