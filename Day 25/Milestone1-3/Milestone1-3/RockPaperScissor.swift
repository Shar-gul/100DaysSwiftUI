//
//  RockPaperScissor.swift
//  Milestone1-3
//
//  Created by Tiago Valente on 13/08/2022.
//

enum Gesture: Int {
    case rock
    case paper
    case scissor
}
struct RockPaperScissor {
    func checkPlay(userGesture: Gesture,
                   appGesture: Gesture,
                   userShouldWin: Bool) -> Bool {
        let winningMove = isWinningMove(userGesture,
                                         appGesture: appGesture)

        if (userShouldWin && winningMove) || (!userShouldWin && !winningMove) {
            return true
        } else {
            return false
        }
    }
    
    private func isWinningMove(_ userGesture: Gesture,
                               appGesture: Gesture) -> Bool {
        switch userGesture {
        case .rock:
            return appGesture == .scissor
        case .paper:
            return appGesture == .rock
        case .scissor:
            return appGesture == .paper
        }
    }
}
