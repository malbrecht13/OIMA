//
//  NasalSteroidInstructions.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NasalSteroidInstructions: View {
    var body: some View {
        VStack {
            
            Text("Nasal steroid instructions").modifier(TitleModifier(fillColor: green))

            VStack(alignment: .leading) {
                Text("Steps:").underline().padding(.bottom)
                Text("1. Shake bottle well.\n\n2. Bend neck to look at floor.\n\n3. Use right hand for left nostril and left hand for right nostril.  \n\n4. Aim toward outer wall of nose and squirt number of inhalations as directed.\n\n5. Do not sniff hard.")
                
                Text("\n\nSource: Rosenfeld et al. Clinical practice guideline (update): Adult sinusitis. ") + Text("Otolaryngology-Head and Neck Surgery. ").italic()
                    + Text("2015;152(2S):S1-S39.")
            }.font(.footnote).padding()
            
            Spacer()
        }
    }
}

struct NasalSteroidInstructions_Previews: PreviewProvider {
    static var previews: some View {
        NasalSteroidInstructions()
    }
}
