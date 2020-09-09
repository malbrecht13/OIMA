//
//  NeuroTestsDizziness.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NeuroTestsDizziness: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    var body: some View {
        Text("NeuroTests")
    }
}

struct NeuroTestsDizziness_Previews: PreviewProvider {
    static var previews: some View {
        NeuroTestsDizziness(dizzy: DizzinessData())
    }
}
