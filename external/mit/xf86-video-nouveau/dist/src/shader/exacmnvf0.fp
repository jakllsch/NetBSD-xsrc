#ifndef ENVYAS
static uint32_t
NVF0FP_Composite[] = {
	0x00001462,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x80000000,
	0x00000a0a,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x0000000f,
	0x00000000,
#include "exacmnvf0.fpc"
};
#else

interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
rcp f32 $r0 $r0
interp mul f32 $r3 a[0x94] $r0 0x0 0x0
interp mul f32 $r2 a[0x90] $r0 0x0 0x0
tex t lauto live dfp #:#:#:$r4 t2d c[0x4] xy__ $r2:$r3 0x0
interp mul f32 $r1 a[0x84] $r0 0x0 0x0
interp mul f32 $r0 a[0x80] $r0 0x0 0x0
tex t lauto live dfp $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
texbar 0x0
mul ftz rn f32 $r3 $r3 $r4
mul ftz rn f32 $r2 $r2 $r4
mul ftz rn f32 $r1 $r1 $r4
mul ftz rn f32 $r0 $r0 $r4
exit
#endif
