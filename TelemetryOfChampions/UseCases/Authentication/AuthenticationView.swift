//
//  AuthenticationView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 2/3/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State var userEmail = ""
    @State var userPassword = ""
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    
                    WelcomeAuthView()
                        .padding()
                    
                    TextField("Enter your email", text: $userEmail)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 350)
                        .font(.custom("Formula1", size: 15))
                        .keyboardType(.emailAddress)
                        .padding()
                    
                    SecureField("Enter your password", text: $userPassword)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 350)
                        .font(.custom("Formula1", size: 15))
                    
                    Button {
                        //
                    } label: {
                        Text("Login")
                    }
                    .font(.custom("Formula1", size: 20))
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("Don't have an account?")
                            .foregroundColor(.white)
                            .font(.custom("Formula1", size: 15))
                        
                        Button {
                            //
                        } label: {
                            Text("Register now")
                        }
                        .font(.custom("Formula1", size: 15))
                        
                    }
                    
                }
                
            }
        }
        
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
