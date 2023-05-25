//
//  Page2.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import SwiftUI

struct Page2: View {
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                
                Image("parameters")
                    .resizable()
                    .frame(width: 200, height: 115)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()
                Text("onboarding.page2.intro")
                    .font(.custom("Formula1", size: 20))
                    .foregroundColor(.white)
                
            }
        }
        
    }
}

struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        Page2()
        
        Page2()
            .previewDevice("iPhone SE (3rd generation)")
    }
}

