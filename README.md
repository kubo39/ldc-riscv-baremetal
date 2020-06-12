# LDC: RISC-V Barenetal


## Get toolchain (optional)

```console
$ mkdir gcc
$ curl -L https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz | tar --strip-components=1 -C gcc -xz
$ mkdir qemu
$ curl -L https://static.dev.sifive.com/dev-tools/riscv-qemu-4.1.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz | tar --strip-components=1 -C qemu -xz
```

## Compile

```console
$ ldc2 -mtriple=riscv32-unknown-none-elf -mcpu=generic-rv32 \
  -mattr=+m,+a,+c -lib -betterC -of=libehello.a hello.d
$ riscv64-unknown-elf-gcc -T linker.ld boot.S libhello.a -o hello \
  -march=rv32imac -mabi=ilp32 -nostdlib
```

## Run

```console
$ qemu-system-riscv32 -nographic -machine sifive_u -kernel hello
```

### Known Issue

#### error while loading shared library: libpng.so.0: cannot open shared object: No such file or directory

```console
$ wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
$ dpkg -i /tmp/libpng12.deb
```
