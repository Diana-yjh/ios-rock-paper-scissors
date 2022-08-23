//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

import Foundation

class RockPaperScissors {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let inputedUserNumber: Int = Int(bindUserInput()) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
            return
        }
        playGame(inputedUserNumber)
    }

    private func bindUserInput() -> String {
        guard let userInput = readLine() else {
            return bindUserInput()
        }
        return userInput
    }

    private func playGame(_ userNumber: Int) {
        switch userNumber {
        case 0:
            print("게임 종료")
        case 1, 2, 3:
            compareNumbers(makeComputerNumber(), userNumber)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }

    private func makeComputerNumber() -> Int {
        let computerNumber: Int = Int.random(in: 1...3)
        return computerNumber
    }

    private func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: Int = computerGameNumber - userGameNumber
        switch differenceNumber {
        case -2, 1:
            print("이겼습니다!")
        case -1, 2:
            print("졌습니다!")
        default:
            print("비겼습니다!")
            startGame()
        }
    }
}