//
//  VVSSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 1/7/21.
//  Copyright © 2021 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VVSSheet: View {
    
    private let prodrome: [String] = ["Diaphoresis", "Warmth", "Pallor"]
    private let triggers: [String] = ["Prolonged standing", "Emotional stress", "Pain", "Medical procedures"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("The following are suggestive of vasovagal syncope").modifier(TitleModifier(fillColor: red, foregroundColor: .white)).padding(.bottom, -10)
            VStack(alignment: .leading) {
                Text("Prodrome").font(.footnote).fontWeight(.bold).padding(.bottom, 1)
                ForEach(prodrome, id: \.self) { item in
                    Text("\(item)").font(.caption)
                }
                Text("Triggers").font(.footnote).fontWeight(.bold).padding(.vertical, 1)
                ForEach(triggers, id: \.self) { item in
                    Text("\(item)").font(.caption)
                }
                Text("Post-syncope").font(.footnote)
                    .fontWeight(.bold).padding(.vertical, 1)
                Text("Fatigue").font(.caption)
            }.padding()
            Spacer()
        }
    }
}

struct VVSSheet_Previews: PreviewProvider {
    static var previews: some View {
        VVSSheet()
    }
}
