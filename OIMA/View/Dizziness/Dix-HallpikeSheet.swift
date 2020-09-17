//
//  Dix-HallpikeSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct Dix_HallpikeSheet: View {
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Dix-Hallpike manuever instructions").modifier(TitleModifier(fillColor: green)).padding(.bottom)
                
                Button(action: {
                    let url = URL(string: "https://youtu.be/LxD-lgqix-s")
                    
                    if let url = url {
                        UIApplication.shared.open(url)
                    }
                    
                }) {
                    Text("Dix-Hallpike YouTube Video")
                    }.buttonStyle(NextButtonStyle(fillColor: red)).padding()
                
                VStack(alignment: .leading, spacing: 10) {
                   Text("Steps:")
                   Text("1. Patient sits on the exam table with eyes open.")
                   Text("2. Turn patient's head 45 degrees to the right and support patient's head as patient lies down.")
                   Text("3. Patient's head should now be hanging off the end of the exam table at about 20 degrees below the table surface.  Support them in this position for 30 seconds and look for nystagmus.")
                   Text("4. Returns patient to upright position and observe for 30 seconds.")
                   Text("5. Repeat steps 1-4 on the left side.")
                    
                   Text("\nA positive test is one in which any of these maneuvers causes vertigo, with or without nystagmus.  \n\nThe most common form of BPPV is posterior canal BPPV.  In this type, nystagmus will be beating upward and torsionally towards the affected ear.  \n\nHorizontal canal BPPV is less common and results in horizontal nystamus when the patient is lying down during the maneuver.")
                   
                }.padding()
                
                
                Spacer()
            }
        }
    }
}

struct Dix_HallpikeSheet_Previews: PreviewProvider {
    static var previews: some View {
        Dix_HallpikeSheet()
    }
}
