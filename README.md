# 묵찌빠게임 README
> 프로젝트 기간 2022/08/22 ~ 2022/08/26 
> 팀원: [애종](https://github.com/jonghancha), [Mangdi](https://github.com/MangDi-L) / 리뷰어: 수꿍

# 목차
- [프로젝트 소개](#소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [타임라인](#타임라인)
- [키워드](#키워드)
- [그라운드 룰](#그라운드-룰)
- [순서도](#순서도)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)

## 소개
> 가위바위보 승패로 선공을 정한 후 묵찌빠에서 비길경우 승리하거나 패배하고 비기지않을경우 가위바위로방식으로 선공을 정하고 다시 묵찌빠를 진행합니다.

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4-blue)]()

## 타임라인
[Commit History](https://github.com/MangDi-L/ios-rock-paper-scissors/commits/step2)

## 키워드
- `재귀함수`, `while`, `switch`, `guard` 
- `연산 프로퍼티`, `enum`, `class`, `상속`
- `파일 분리`, `함수 세분화`

## 그라운드 룰
### - 연락 가능시간(회의 가능시간)

평일
애종 : 오전 오후 언제든 가능 (* 월 수 금 운동 7시 ~ 10시 (조정가능))
Mangdi : 보통 언제든 가능 (오후 9 ~ 10시 전까지만!)

스크럼
시간 : 오전 9시 (15분~ 20분 정도)
내용 : 어제 공부한 부분, 오늘의 공부 목표(프로젝트 관련 포함) 회의하고 오전 시작

### - 목표
- 주중안에 끝내기! 


## 순서도
![MukChiBbaGame](https://user-images.githubusercontent.com/49121469/186857774-dd5a4b6a-391e-4b0e-a27e-731b9ec8d055.png)

## 실행 화면
![RockScissorsPaperGame_DemonstrationGIF](https://user-images.githubusercontent.com/49121469/186836536-9b273734-ed38-4332-b1f5-f0185e6565d5.gif)

## 트러블 슈팅

### 🤔겪었던 문제점, 고민했던 부분 → 😎해결책
> 1) 가위 바위 보를 숫자 1,2,3으로 받을때 매직넘버임을 인지하고 이것을 어떻게 해결할까 고민 -> enum타입을 생성하여 case별로 rock,scissors,paper를 나누어 rawValue로 지정

> 2) 스위치문이 너무 길어서 최대한 압축해서 쓸방법이 없을까 고민 -> 튜플을 이용해서 스위치문의 여러 case들을 하나로 압축

> 3) if 를 사용할 것인가, guard를 사용할 것인가? -> if와 guard의 차이점 중에는 if는 블록 안에서 변수를 사용하고 guard는 else문 바깥에서 변수를 사용한다는 점이 있다. 때문에 코드의 depth가 길어질수록 guard를 사용하는 것이 가독성이 높을 수 있다. 중요한건 어떤 코드를 작성하더라도 근거가 필요하다.

> 4) 서로다른클래스가 같은 내용의 함수를 공유하면 이를 어떻게 분배를 할까 고민했다. -> 같은내용을 쓰는 함수를 다른 파일로 분리하여 서로다른클래스가 상속하여 사용할수있게 했다.

### 😮알게 된 점
- enum 내부에서 랜덤으로 요소 뽑아내기 : enum 타입 옆에 `CaseIterable` 추가 -> EnumName.allCases.randomElement() 사용
- 삼항연산자(a ? b : c) : a 조건문이 true라면 b를 return,false라면 c return
- import foundation : 프레임워크. 보통의 경우 swift standard library만으로도 정상적으로 돌아가지만 foundation이 필요한 경우엔 import 해줘야 한다

### 😭해결하지 못한 점
- 10줄 이내의 코드로 함수 구성하기
- 함수가 하나의 기능만을 맡기
- class, struct, enum의 적극적인 사용
