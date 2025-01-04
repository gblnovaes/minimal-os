all:
	nasm -fbin boot.asm -o ./boot/boot.bin

clean:
	rm ./boot/*.bin

run:
	qemu-system-i386 -hda ./boot/boot.bin