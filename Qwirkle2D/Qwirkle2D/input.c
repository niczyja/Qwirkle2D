//
//  input.c
//  Qwirkle2D
//
//  Created by Maciej Sienkiewicz on 27/12/2023.
//

#include "common.h"
#include "input.h"

void processInput(void) {
    SDL_Event event;
    
    while (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_QUIT:
                exit(0);
                break;
            default:
                break;
        }
    }
}
