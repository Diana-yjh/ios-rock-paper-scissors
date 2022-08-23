//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

enum Hand: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
}

var gameStopCheck: Bool = true

func gameStart() {
    while gameStopCheck {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let inputNumberString = readLine(), let inputNumber = Int(inputNumberString),
                inputNumber >= 0, inputNumber < 4
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

//콘솔을 통해 게임을 진행합니다.
//최초 실행 시 출력
//가위(1), 바위(2), 보(3)! <종료 : 0> :
//사용자에게 0, 1, 2, 3 중 한 가지를 입력받아 결과를 출력합니다.
//컴퓨터의 패는 임의의 패를 정하여 냅니다.
//비긴 경우 : “비겼습니다!” 출력 후 다시 최초 실행 상태로 복귀
//이긴 경우 : “이겼습니다!” 출력 후 게임 종료
//진 경우 : “졌습니다!” 출력 후 게임 종료
//0을 입력받은 경우 : 게임 종료
//0~3이 아닌 값을 입력받은 경우 : “잘못된 입력입니다. 다시 시도해주세요.” 출력 후 최초 실행 상태로 복귀

//가위(1), 바위(2), 보(3)! <종료 : 0> : 1
//비겼습니다!
//가위(1), 바위(2), 보(3)! <종료 : 0> : 6
//잘못된 입력입니다. 다시 시도해주세요.
//가위(1), 바위(2), 보(3)! <종료 : 0> : 3
//이겼습니다!
//가위(1), 바위(2), 보(3)! <종료 : 0> : 0
//게임 종료
