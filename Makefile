CXXFLAGS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASFLAGS = --32


objects = kernel.o loader.o

%o: %.cpp
	g++ $(CXXFLAGS) -o $@ -c $<

%o: %.s
	as $(ASFLAGS) -o $@ $<

kernel.bin: linker.ld $(objects)
	ld -melf_i386 -T $< -o $@ $(objects)

install: kernel.bin
	sudo cp $< /boot/kernel.bin

clean:
	rm kernel.o loader.o kernel.bin
