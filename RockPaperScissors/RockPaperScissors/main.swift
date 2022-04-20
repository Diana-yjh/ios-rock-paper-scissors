//
//  RockPaperScissors - main.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var continueGameCheck: Bool = true

func startGame() {
    while continueGameCheck {
        printUserInterface()
        let userSelectedCard = readLine()?.trimmingCharacters(in: .whitespaces) ?? ""

        if userSelectedCard == "0" {
            endGame()
        } else if verifyUserInput(of: userSelectedCard) {
            let targetNumber = convertNumberToGameCard(of: userSelectedCard)
            judgeMatchResult(inputUserNumber: targetNumber)
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    printGameOver()
}

func printUserInterface() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerNumber() -> RockPaperScissors {
    let randomNumberRange: ClosedRange<Int> = 1...3
    return RockPaperScissors(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
}

func verifyUserInput(of userChoiceCard: String) -> Bool {
    let cardList: Array<String> = ["1","2","3"]
    
    if cardList.contains(userChoiceCard) {
        return true
    } else {
        return false
    }
}

func convertNumberToGameCard(of targetNumber: String) -> RockPaperScissors {
    switch targetNumber {
    case "1":
        return .scissors
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .wrong
    }
}

func printGameOver() {
    print("게임 종료")
}

func endGame() {
    continueGameCheck = false
}

func judgeMatchResult(inputUserNumber: RockPaperScissors) {
    let computerRandomNumber = generateComputerNumber()
    
    if inputUserNumber == computerRandomNumber {
        printMatchResult(matchResult: "tie")
        return
    }
    
    if inputUserNumber == .scissors {
        computerRandomNumber == .paper ? printMatchResult(matchResult: "win") : printMatchResult(matchResult: "lose")
    }
    
    if inputUserNumber == .paper {
        computerRandomNumber == .rock ? printMatchResult(matchResult: "win") : printMatchResult(matchResult: "lose")
    }
    
    if inputUserNumber == .rock {
        computerRandomNumber == .scissors ? printMatchResult(matchResult: "win") : printMatchResult(matchResult: "lose")
    }
}

func printMatchResult(matchResult: String) {
    switch matchResult {
    case "win":
        print("이겼습니다!")
        endGame()
    case "lose":
        print("졌습니다!")
        endGame()
    default:
        print("비겼습니다!")
    }
}

startGame()
