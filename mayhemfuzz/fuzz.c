#define MINIMP3_IMPLEMENTATION
#include "../minimp3.h"
#include <stdio.h>

int LLVMFuzzerTestOneInput(char* buf, size_t size)
{
    static mp3dec_t mp3d;
    mp3dec_frame_info_t info;

    mp3dec_init(&mp3d);

    short pcm[MINIMP3_MAX_SAMPLES_PER_FRAME];
    mp3dec_decode_frame(&mp3d, buf, size, pcm, &info);

    return 0;
}