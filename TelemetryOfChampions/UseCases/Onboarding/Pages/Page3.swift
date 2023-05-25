//
//  Page3.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import SwiftUI

struct Page3: View {
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                
                Image("drivers")
                    .resizable()
                    .frame(width: 250, height: 75)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()
                Text("onboarding.page3.intro")
                    .font(.custom("Formula1", size: 20))
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}
