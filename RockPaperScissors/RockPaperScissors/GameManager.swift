//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    enum GameMessage {
        static let endingMessage = "게임 종료"
        static let winningMessage = "이겼습니다!"
        static let losingMessage = "졌습니다!"
        static let drawMessage = "비겼습니다!"
        static let invalidHandShapeInput = "잘못된 입력입니다. 다시 시도해주세요."
        static let rockPaperScissorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    }
    
    func startRockPaperScissorsGame() {
        guard let userHandShape = receiveHandShapeFromUser() else {
            print(GameMessage.endingMessage)
            return
        }
        let gameResult = fetchGameResult(of: userHandShape)
        
        switch gameResult {
        case .win:
            print(GameMessage.winningMessage)
            return
        case .lose:
            print(GameMessage.losingMessage)
            return
        case .draw:
            print(GameMessage.drawMessage)
            startRockPaperScissorsGame()
        }
    }
    
    private func receiveHandShapeFromUser() -> HandShape? {
        printRockPaperScissorsManual()
        let userInput = receiveInputFromUser()
        guard let convertedInput = Int(userInput) else {
            print(GameMessage.invalidHandShapeInput)
            return receiveHandShapeFromUser()
        }
        
        switch convertedInput {
        case 1...3:
            return HandShape.init(rawValue: convertedInput)
        case 0:
            return nil
        default:
            print(GameMessage.invalidHandShapeInput)
            return receiveHandShapeFromUser()
        }
    }
    
    private func printRockPaperScissorsManual() {
        print(GameMessage.rockPaperScissorsManual, terminator: "")
    }
    
    private func receiveInputFromUser() -> String {
        guard let input = readLine() else { return "" }
        return input
    }
    
    private func fetchGameResult(of userHandShape: HandShape) -> GameResult {
        let computerHandShape = generateRandomHandShape()
        
        if userHandShape == computerHandShape {
            return .draw
        } else if userHandShape.isWin(comparing: computerHandShape) {
            return .win
        } else {
            return .lose
        }
    }
    
    private func generateRandomHandShape() -> HandShape {
        guard let handShape = HandShape.init(rawValue: Int.random(in: 1...3)) else { return generateRandomHandShape() }
        return handShape
    }
}
