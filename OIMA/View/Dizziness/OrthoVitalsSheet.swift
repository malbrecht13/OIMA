//
//  OrthoVitalsSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/10/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct OrthoVitalsSheet: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Orthostatic vitals measurement").modifier(TitleModifier(fillColor: green))
                VStack(alignment: .leading, spacing: 10) {
                    Text("Steps:")
                    Text("1. Have patient lie down at least 5 minutes first.")
                    Text("2. Check blood pressure supine.")
                    Text("3. Check blood pressure after patient standing for 2 minutes.")
                    
                    Text("\nOrthostatic hypotension is diagnosed if from supine to standing if at least one of these is present:")
                    Text("1. Systolic blood pressure decreases > 20 mm Hg.")
                    Text("2. Diastolic blood pressure decreases > 10 mm Hg.")
                    Text("3. Pulse increases by 30 beats/minute.")
                    
                    Text("\nIf the patient has orthostatic dizziness but no orthostatic hypotension or positive Dix-Hallpike, a full neurologic assessment needs to be performed.")
                }.padding()
            }
        }
    }
}

struct OrthoVitalsSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrthoVitalsSheet()
    }
}
