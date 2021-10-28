import SwiftUI

struct GameView: View {
    //MARK: - Properties
    @StateObject private var vM = GameViewModel()
    
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                LazyVGrid(columns: vM.columns, spacing: 5){
                    ForEach(0..<9){ index in
                        ZStack{
                            GameSquareView(proxy: geo)
                            PlayerIndicator(systemImageName: vM.moves[index]?.indicator ?? "")
                        }
                        .onTapGesture { vM.processPlayerMove(for: index) }
                    }
                }
                Spacer()
            }
            .disabled(vM.isGameBoardDisabled)
            .padding()
            .alert(item: $vM.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: {vM.resetGame()}))
            }
        }
    }
}


enum Player{
    case human, computer
}


struct Move{
    let player: Player
    let boardIndex: Int
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .opacity(0.5)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
