//
//  WelcomeAuthView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 2/3/23.
//

import SwiftUI

struct WelcomeAuthView: View {
    var body: some View {
        
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
            
            Text("Register now and start generating telemetry!")
                .font(.custom("Formula1", size: 15))
                .padding(.top)
                .foregroundColor(.white)
            
        }
        
    }
}

struct WelcomeAuthView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeAuthView()
            .preferredColorScheme(.dark)
    }
}
