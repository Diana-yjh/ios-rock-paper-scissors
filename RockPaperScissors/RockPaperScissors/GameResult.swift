//
//  RockPaperScissors - GameResult.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissorsGameResult {
    case win, lose, draw
    
    var winner: String? {
        switch self {
        case .win:
            return Player.user
        case .lose:
            return Player.computer
        case .draw:
            return nil
        }
    }
    
    func printMessage() {
        switch self {
        case .win:
            print(GameResultMessage.winning)
        case .lose:
            print(GameResultMessage.losing)
        case .draw:
            print(GameResultMessage.draw)
        }
    }
}

enum MukJjiBbaGameResult {
    case win
    case reMatch(RockPaperScissorsGameResult)
    
    var shouldReMatch: Bool {
        switch self {
        case .win:
            return false
        case .reMatch:
            return true
        }
    }
    
    var nextTurnPlayer: String? {
        switch self {
        case .win:
            return nil
        case .reMatch(let rockPaperScissorsGameResult):
            return rockPaperScissorsGameResult.winner
        }
    }
}
