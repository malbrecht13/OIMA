//
//  ReferenceView.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct ReferenceView: View {
    
    let sortedCitationArray: [Citation]
    let topic: String
    let fillColor: Color
    
    var body: some View {
        VStack {
            Text("References")
                .modifier(TitleModifier(fillColor: fillColor))
            Form {
                Section(header: Text(topic), content: {
                        ForEach(sortedCitationArray, id: \.self) { citation in
                            Text("\(citation.first)").font(.caption)
                                + Text("\(citation.italicized)").italic().font(.caption)
                            + Text("\(citation.last)").font(.caption)
                        }
                        
                    
                })
            }
        }
    }
}

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView(sortedCitationArray: [Citation(first: "First part of citation.", italicized: " Italicized part. ", last: "last part")], topic: "Topic", fillColor: green)
    }
}
