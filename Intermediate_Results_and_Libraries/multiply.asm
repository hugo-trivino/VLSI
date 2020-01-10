loadi @0, 0;
loadi @1, 1;
loadi @2, 31;
loadi @3, 16; 0x10
loadi @4, 15; 0x0F
loadi @5, 8;
sll @3, @3, @5;
add @3, @3, @4;
loadi @4, 5; 0x05
loadi @6, 248; 0xF8
loadi @7, 245; 0xF5
sll @4, @4, @5;
sll @4, @4, @5;
sll @6, @6, @5;
add @4, @4, @6;
add @4, @4, @7;
loadi @5, 1;
loadi @8, 0;
sll @5, @5, @2;
and @6, @5, @4;
jz @6, 23;
sll @7, @3, @2;
add @8, @8, @7;
srl @5, @5, @1;
sub @2, @2, @1;
jnz @2, 19
and @6, @5, @4;
sll @7, @3, @2;
add @8, @8, @7;
stop ;