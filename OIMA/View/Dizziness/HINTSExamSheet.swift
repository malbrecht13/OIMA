//
//  HINTSExamSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HINTSExamSheet: View {
    var body: some View {
        
        ScrollView {
            VStack {
                Text("HINTS exam instructions").modifier(TitleModifier(fillColor: green)).padding(.bottom)
                
                
                YouTubeButton(address: "https://youtu.be/1q-VTKPweuk", text: "HINTS exam YouTube Video")
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("This test is to be performed in patients with ongoing vertigo and nystagmus.  Click the video link above to watch this test in action.  The HINTS consists of three exam maneuvers, described below.  If any of the tests suggest central etiology, a central etiology (i.e., stroke) must be ruled out.")
                        
                        Text("Head-impulse test").underline()
                        Text("1. Have patient stay focused on your nose.  Turn patient's head slowly to the left about 20 degrees.")
                        Text("2. Rapidly jerk the patient's head to midline and watch for saccades.")
                        Text("If saccades are present in the setting of a patient with both vertigo an nystagmus, it suggests a peripheral etiology.  If no saccades, a central etiology is suggested.")
                    }
                    Text("Nystagmus").underline()
                    Text("1. Perform extraocular movements.")
                    Text("Horizontal nystagmus suggests peripheral etiology. A central etiology is suggested if predominantly vertical or torsional nystagmus, or changes direction when looking left and right (i.e., bidirectional nystagmus).")
                    Text("Test of skew").underline()
                    Text("1. Think of this as the 'cover-uncover test.'")
                    Text("2. The patient looks straight ahead and the examiner covers one eye and then the other with one hand.")
                    Text("If the patient has vertical deviation of an eye after uncovering, a central etiology is suggested.")
                    
                }.padding().font(.footnote)
                
                Spacer()
            }
        }
    }
}

struct HINTSExamSheet_Previews: PreviewProvider {
    static var previews: some View {
        HINTSExamSheet()
    }
}
