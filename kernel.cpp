void print(char* str) {
    unsigned short* VideoMem = (unsigned short*) 0xB8000;
    for(int i = 0; str[i] != '\0'; ++i) 
        VideoMem[i] = (VideoMem[i] & 0xFF00) | str[i];
}

extern "C" void KernelMain(void* multiboot_str, unsigned int magic) {
    print("Hello World");
    while(true);
}