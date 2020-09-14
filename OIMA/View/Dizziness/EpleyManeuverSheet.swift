//
//  EpleyManeuverSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EpleyManeuverSheet: View {
    var body: some View {
        VStack {
            
            Text("Epley maneuver instructions").modifier(TitleModifier(fillColor: green))

            Button(action: {
                let url = URL(string: "https://youtu.be/K4S4CbuN6QA")
                
                if let url = url {
                    UIApplication.shared.open(url)
                }
                
            }) {
                Text("Epley maneuver YouTube video")
                }.buttonStyle(NextButtonStyle(fillColor: red)).padding()
            
            VStack(alignment: .leading) {
                Text("Steps:").underline()
                Text("1. Turn patient's head 45 degrees to right.")
                Text("2. Lay patient down fairly quickly with next extended 20 degrees off end of exam table.  Hold this position about 30 seconds.")
                Text("3. Turn patient's head to left while they are still lying down. Hold for 30 seconds.")
                Text("4. Patient turns onto their left side with head still being turned to the left.  They should now be looking at the floor.  Hold for 30 seconds.")
                Text("5. Patient sits up.")
                Text("6. Steps can be repeated on either side multiple times.")
            }.font(.footnote).padding()
            
            Spacer()
        }
    }
}

struct EpleyManeuverSheet_Previews: PreviewProvider {
    static var previews: some View {
        EpleyManeuverSheet()
    }
}
