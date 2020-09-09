//
//  TriggeredDizzinessTests.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct TriggeredDizzinessTests: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    var body: some View {
        Text("Triggered")
    }
}

struct TriggeredDizzinessTests_Previews: PreviewProvider {
    static var previews: some View {
        TriggeredDizzinessTests(dizzy: DizzinessData())
    }
}
