import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext{
    static let humanWin = AlertItem(title: Text("You Won!"), message: Text("You are so smart!"), buttonTitle: Text("Hell yeah"))
    static let computerWin = AlertItem(title: Text("You Lost!"), message: Text("Ohhh..."), buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw!"), message: Text("What a battle it was, wasn't it?"), buttonTitle: Text("Try Again"))
}
