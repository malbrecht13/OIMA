//
//  YouTubeButton.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/18/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct YouTubeButton: View {
    
    let address: String  //address will be the url address
    let text: String // Will be the text of the button
    
    var body: some View {
        Button(action: {
            let url = URL(string: address)
            
            if let url = url {
                UIApplication.shared.open(url)
            }
            
        }) {
            Text(text)
            }.buttonStyle(NextButtonStyle(fillColor: red)).padding()
    }
}
