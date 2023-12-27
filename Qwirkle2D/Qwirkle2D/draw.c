//
//  draw.c
//  Qwirkle2D
//
//  Created by Maciej Sienkiewicz on 28/12/2023.
//

#include "common.h"
#include "draw.h"

extern App app;

void prepareScene(void) {
    SDL_SetRenderDrawColor(app.renderer, 96, 128, 255, 255);
    SDL_RenderClear(app.renderer);
}

void presentScene(void) {
    SDL_RenderPresent(app.renderer);
}
