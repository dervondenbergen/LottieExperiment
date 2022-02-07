//
//  ContentView.swift
//  LottieExperiment
//
//  Created by Felix De Montis on 05.02.22.
//

import SwiftUI

struct ContentView: View {
    @State var isPlaying: Bool = true
    @State var start: Bool = true
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("loop")) {
                    VStack {
                        Toggle("Change Playstate", isOn: $isPlaying)
                            .toggleStyle(.switch)
                        Text("Is Playing? \(isPlaying.description)")
                    }
                    
                    LottieView(name: "loader.desygner", playing: $isPlaying)
                    
                }
                
                Section(header: Text("once")) {
                    VStack {
                        Toggle("Start Animation", isOn: $start)
                            .toggleStyle(.button)
                            .disabled(start)
                        Text("Is Playing? \(start.description)")
                    }
                    
                    LottieView(name: "loader.desygner", playing: $start, loopMode: .playOnce)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
