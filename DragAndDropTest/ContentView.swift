//
//  ContentView.swift
//  DragAndDropTest
//
//  Created by klifton Cheng stu on 8/4/23.
//

import SwiftUI

struct ContentView: View {
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")

    var body: some View {
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .draggable(Image(systemName: sport)) {
                            Label("", systemImage: sport)
                        }
                        .cornerRadius(10)
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)
            .cornerRadius(10)

            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundColor(.white)
                .dropDestination(for: Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photo")
                    return true
                }
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
