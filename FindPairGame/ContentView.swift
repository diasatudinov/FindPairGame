//  ContentView.swift
//  FindPairGame
//
//  Created by Atudinov Dias on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    var emojisTransport = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟"]
    
    var emojisFlag = [ "🏳️", "🏴", "🏁", "🚩", "🏳️‍🌈", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🇧🇷", "🇮🇴", "🇻🇬", "🇧🇳", "🇧🇬", "🇧🇫", "🇧🇮", "🇨🇻", "🇰🇭", "🇨🇲", "🇨🇦", "🇮🇨", "🇰🇾", "🇨🇫", "🇹🇩", "🇨🇱", "🇨🇳", "🇨🇽", "🇨🇨", "🇨🇴", "🇰🇲", "🇨🇬", "🇨🇩", "🇨🇰", "🇨🇷", "🇨🇮", "🇭🇷", "🇨🇺", "🇨🇼", "🇨🇾", "🇨🇿", "🇩🇰", "🇩🇯", "🇩🇲", "🇩🇴", "🇪🇨", "🇪🇬", "🇸🇻", "🇬🇶", "🇪🇷", "🇪🇪", "🇪🇹"]
    
    var emojisSport = [ "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒", "🏑", "🏏", "⛳️", "🏹", "🎣", "🥊", "🥋", "⛸", "🎿", "⛷", "🏂", "🏋️‍♀️", "🏋", "🤺", "🤼‍♀", "🤼‍♂", "🤸‍♀", "🤸‍♂", "⛹️‍♀️", "⛹", "🤾‍♀"]
    
    @State var emojiCountTransport = 20
    @State var emojiCountFlag = 10
    @State var emojiCountSport = 15
    
    @State var isTransport = true
    @State var isFlag = false
    @State var isSport = false
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    if isTransport {
                        ForEach(emojisTransport[ 0..<emojiCountTransport].shuffled(), id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } else if isFlag {
                        ForEach(emojisFlag[0..<emojiCountFlag].shuffled(), id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                            
                        }
                    } else if isSport {
                        ForEach(emojisSport[0..<emojiCountSport].shuffled(), id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
            }
//            Spacer()
            HStack(spacing: 75){
                Button {
                    isTransport = true
                    isFlag = false
                    isSport = false
                } label: {
                    VStack {
                        Image(systemName: "car")
                            .font(.largeTitle)
                        Text("Vehicles")
                    }
                }
                
                Button {
                    isTransport = false
                    isFlag = true
                    isSport = false
                } label: {
                    VStack {
                        Image(systemName: "flag.fill")
                            .font(.largeTitle)
                        Text("Flags")
                    }
                    
                }
                
                Button {
                    isTransport = false
                    isFlag = false
                    isSport = true
                } label: {
                    VStack {
                        Image(systemName: "figure.disc.sports")
                            .font(.largeTitle)
                        Text("Activities")
                    }
                }
                
                
                
            }
        }
        .padding(.horizontal)
    }
    
//    var remove: some View{
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View{
//        Button {
//            if emojiCount < emojisTransport.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}


//var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁", "🛩", "✈️", "🛫", "🛬", "🚀", "🛰", "💺", "🛶", "⛵️", "🛥", "🚤", "🛳", "⛴", "🚢"]
