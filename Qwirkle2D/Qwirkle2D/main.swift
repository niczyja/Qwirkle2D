//
//  main.swift
//  Qwirkle2D
//
//  Created by Maciej Sienkiewicz on 30/01/2024.
//

import Foundation
import QwirkleKit
import SDL

func prepareScene(_ renderer: OpaquePointer) {
    SDL_SetRenderDrawColor(renderer, 96, 128, 255, 255)
    SDL_RenderClear(renderer)
}

func presentScene(_ renderer: OpaquePointer) {
    SDL_RenderPresent(renderer)
}

func processInput() {
    var event = SDL_Event()
    
    while (SDL_PollEvent(&event) != 0) {
        switch (event.type) {
        case SDL_QUIT.rawValue:
            exit(0);
            break;
        default:
            break;
        }
    }
}

enum SDLError: Error {
    case initError, createWindow, createRenderer
    
    var localizedDescription: String {
        "SDL error: \(String(cString: SDL_GetError()))"
    }
}

guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
    fatalError(SDLError.initError.localizedDescription)
}

let center = Int32(SDL_WINDOWPOS_CENTERED_MASK)

guard let window = SDL_CreateWindow("Qwirkle", center, center, 800, 800, 0) else {
    fatalError(SDLError.createWindow.localizedDescription)
}

SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "linear")

guard let renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED.rawValue) else {
    fatalError(SDLError.createRenderer.localizedDescription)
}

defer {
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(window)
    SDL_Quit()
}

while true {
    prepareScene(renderer)
    processInput()
    presentScene(renderer)
    
    SDL_Delay(16)
}
