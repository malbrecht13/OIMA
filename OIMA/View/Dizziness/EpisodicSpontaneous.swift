//
//  EpisodicSpontaneous.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EpisodicSpontaneous: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Perform exam including neurologic, ENT, and cardiac exams.  Then select if any of these patient factors are present:").font(.headline).foregroundColor(green).padding()) {
                    ShowToggle(binding: $dizzy.nystagmus, count: $dizzy.nullCount, text: "Nystagmus")
                    ShowToggle(binding: $dizzy.ataxia, count: $dizzy.nullCount, text: "Ataxic gait")
                    ShowToggle(binding: $dizzy.doubleVision, count: $dizzy.nullCount, text: "Diplopia")
                }
                
            }
        }
    }
}

struct EpisodicSpontaneous_Previews: PreviewProvider {
    static var previews: some View {
        EpisodicSpontaneous(dizzy: DizzinessData())
    }
}
