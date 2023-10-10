.PHONY:fact,fibo,clean

fact:
	arm-linux-gnueabihf-gcc fact.s -o fact.out
	qemu-arm -L /usr/arm-linux-gnueabihf ./fact
fibo:
	arm-linux-gnueabihf-gcc fibo.s -o fibo.out
	qemu-arm -L /usr/arm-linux-gnueabihf ./fibo
clean:
	rm -fr fibo.out fact.out 
 