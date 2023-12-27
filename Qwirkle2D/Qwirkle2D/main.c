//
//  main.c
//  Qwirkle2D
//
//  Created by Maciej Sienkiewicz on 27/12/2023.
//

#include "common.h"
#include "draw.h"
#include "init.h"
#include "input.h"

App app;

int main(int argc, const char * argv[]) {
    
    memset(&app, 0, sizeof(App));
    
    initSDL();
    atexit(cleanup);
    
    while (1) {
        prepareScene();
        processInput();
        presentScene();
        
        SDL_Delay(16);
    }
    
    return 0;
}
