//
//  Page1.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 23/2/23.
//

import SwiftUI

struct Page1: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Image("tocLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(40)
                    .shadow(radius: 10)
                
                Text("onboarding.page1.welcome")
                    .font(.custom("Formula1", size: 25))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.white)
                
                Text("onboarding.page1.tagline")
                    .font(.custom("Formula1", size: 15))
                    .padding(.top)
                    .foregroundColor(.white)
                
            }
            
        }
        
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
            .environment(\.locale, .init(identifier: "en"))
        Page1()
            .environment(\.locale, .init(identifier: "es"))
    }
}
