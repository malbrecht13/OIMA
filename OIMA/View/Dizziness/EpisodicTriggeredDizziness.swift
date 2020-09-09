//
//  EpisodicDizziness.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EpisodicTriggeredDizziness: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EpisodicDizziness_Previews: PreviewProvider {
    static var previews: some View {
        EpisodicTriggeredDizziness(dizzy: DizzinessData())
    }
}
