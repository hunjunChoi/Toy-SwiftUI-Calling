//
//  ContentView.swift
//  SwiftUI-Call
//
//  Created by HYUNJUN CHOI on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var phoneNumber = "718-589-1234"
    
    var body: some View {
        ZStack {
            //            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Cupertino, CA").font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.black).padding(.bottom, 200)
                
                Spacer()
                
                Button {
                    
                } label: {
                    VStack {
                        Text(verbatim: "Merry Ann").font(.system(size: 40)).foregroundColor(.black)
                        Image(systemName: "star.fill")
                        Divider()
                        Text("Mom")
                    }
                }
                .buttonStyle(.bordered)
                .tint(.green)
                .controlSize(.large)
                .padding(.bottom, 200)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        // Validation of phone number not included
                        let dash = CharacterSet(charactersIn: "-")
                        let cleanString = phoneNumber.trimmingCharacters(in: dash)
                        let phone = "tel://"
                        var phoneNumberFormatted = phone + cleanString
                        
                        // [START method #1]
                        //                    guard let url = URL(string: phoneNumberFormatted) else {return}
                        //                    UIApplication.shared.open(url)
                        // [END method #1]
                        
                        // [START method #2]
                        let url: NSURL = URL(string: phoneNumberFormatted)! as NSURL
                        
                        UIApplication.shared.open(url as URL)
                        // [END method #2]
                    }) {
                        VStack {
                            Image(systemName: "wand.and.rays.inverse")
                            Text("Call")
                        }
                    }
                    .foregroundColor(.orange)
                    .padding(.all)
                    .background(Color.black)
                    .cornerRadius(16)
                    //                .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        let facetimeScheme = "facetime://"
                        var facetimeNumber = facetimeScheme + phoneNumber
                        guard let facetimeURL: NSURL = NSURL(string: facetimeNumber) else {return}
                        UIApplication.shared.open(facetimeURL as URL)},
                           label: {
//                        Label("FaceTime", systemImage: "applelogo")
                        VStack {
                            Image(systemName: "phone")
                            Text("FaceTime")
                        }
                        
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11")
        ContentView().previewDevice("iPhone 14 Pro")
        ContentView().previewDevice("iPhone 14 Pro Max")
    }
}
