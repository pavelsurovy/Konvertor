//
//  ContentView.swift
//  Konvertor
//
//  Created by Palino on 04/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    ConvertVzdialenostView()
                } label: {
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenosť", titleImage: "imageKM")
                }
                
                NavigationLink {
                    ConvertObjemView()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "imageML")
                }
            }
            
//            List {
//                NavigationLink("Vzdialenosť", destination: ConvertVzdialenostView())
//                NavigationLink("Objem", destination: ConvertObjemView())
//            }
            .navigationTitle("Konvertor")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
