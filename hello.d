extern (C):

void __start_ldc()
{
    ubyte* uart = cast(ubyte*) 0x10_013_000;
    foreach (c; "Hello from D!")
        *uart = c;

    while (true) {}
}
