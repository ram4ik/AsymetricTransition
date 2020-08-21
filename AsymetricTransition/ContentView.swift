//
//  ContentView.swift
//  AsymetricTransition
//
//  Created by Ramill Ibragimov on 21.08.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false
    @State private var transform: Bool = false
    
    var body: some View {
        VStack {
            if self.show {
                Rectangle()
                    .frame(width: self.transform ? 250 : 300, height: self.transform ? 250 : 300)
                    .foregroundColor(self.transform ? .orange : .pink)
                    .cornerRadius(self.transform ? 50 : 0)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition
                                        .opacity
                                        .animation(Animation.spring().delay(0.3)),
                                        
                            removal: AnyTransition
                                        .opacity
                                        .animation(.spring())
                        )
                    )
                    .onTapGesture {
                        withAnimation {
                            self.transform.toggle()
                        }
                }
            }
            
            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }) {
                Text("Toggle")
                    .foregroundColor(.black)
                    .bold()
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
