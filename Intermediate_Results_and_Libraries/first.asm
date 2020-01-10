loadi @1, 30;
loadi @2, 5;
loadi @3, 0;
loadi @4, 1;
jz @2, 8;
add @3, @3, @1;
sub @2, @2, @4;
jnz @2, 5;
stop ;