//
//  ContentView.swift
//  Fortune Wheel
//
//  Created by Denis Onofras on 08.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var result: String?
    let data = ["1","2","3","4","5"]
    
    var body: some View {
        VStack {
            FortuneWheel(titles: data, size: 350, onSpinEnd: { index in
                self.result = data[index]
            })
            
            Text("Your result: \(result ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
