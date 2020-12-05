Music_LavenderTown:
	channel_count 3
	channel 1, m_shion_Ch1
	channel 2, m_shion_Ch2
	channel 3, m_shion_Ch3
;	include	group.def
;bank3d	group	G_MUSIC4
;	;
;	;	m_shion
;	;
;	;	Converting on Sat Aug 21 22:22:49 1999
;	;
;	;				by ver 1.01
;	;
;	public	musm_shion
;musm_shion:







;----------------------------------------
m_shion_Ch1:
;----------------------------------------
	tempo 160
	volume 7, 7
; P1-1
	stereo_panning 	FALSE, TRUE
	vibrato 6, 2, 4
	duty_cycle 0
	note_type 12, 11, 3
; P1-2
	rest 16
; P1-3
	rest 16
; P1-4
	rest 16
; P1-5
	rest 16
; P1-6
.loop
	db sound_call_cmd
	dw .sub6_10
; P1-11
	volume_envelope 9, 3
	octave 5
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 9, 3
	note F#,2
	volume_envelope 4, 3
	note F#,2
	volume_envelope 9, 3
	note B_,2
	volume_envelope 4, 3
	note B_,2
	volume_envelope 9, 3
	note A_,2
	volume_envelope 4, 3
	note A_,2
; P1-12
	db sound_call_cmd
	dw .sub12
	volume_envelope 9, 3
; P1-13
	volume_envelope 9, 3
	note F_,2
	volume_envelope 4, 3
	note F_,2
	volume_envelope 9, 3
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 9, 3
	octave 4
	note B_,2
	volume_envelope 4, 3
	note B_,2
	volume_envelope 9, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
; P1-14
	db sound_call_cmd
	dw .sub6_10
; P1-18
	volume_envelope 9, 3
	octave 5
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 9, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
	volume_envelope 9, 3
	note B_,2
	volume_envelope 4, 3
	note B_,2
	volume_envelope 9, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
; P1-20
	db sound_call_cmd
	dw .sub12
; P1-21
	volume_envelope 9, 3
	octave 6
	note C_,2
	volume_envelope 4, 3
	note C_,2
	volume_envelope 9, 3
	octave 5
	note G_,2
	volume_envelope 4, 3
	note G_,2
	volume_envelope 9, 3
	note E_,2
	volume_envelope 4, 3
	note E_,2
	volume_envelope 9, 3
	note C_,2
	volume_envelope 4, 3
	note C_,2
; P1-22
	octave 3
	note F_,2
	note A_,2
	octave 4
	note C_,2
	note E_,2
	note F_,2
	note C_,2
	octave 3
	note A_,2
	note F_,2
; P1-23
.sub23
	octave 3
	note C_,2
	note E_,2
	note G_,2
	note B_,2
	octave 4
	note C_,2
	octave 3
	note G_,2
	note E_,2
	note C_,2
; P1-24
	note F_,2
	note A_,2
	octave 4
	note C_,2
	note E_,2
	note F_,2
	note C_,2
	octave 3
	note A_,2
	note F_,2
	db sound_loop_cmd, 2
	dw .sub23
; P1-25
; P1-26
; P1-27
	note F#,2
	note A_,2
	octave 4
	note C_,2
	note F#,2
	note A_,2
	note C_,2
	octave 3
	note A_,2
	note F#,2
; P1-28
	note G_,2
	octave 4
	note C_,2
	note D_,2
	note F_,2
	note G_,2
	note F_,2
	note D_,2
	note C_,2
; P1-29
	octave 3
	note B_,8
	note B_,8
; P1-30
	db sound_loop_cmd, 0
	dw .loop
.sub6_10
	volume_envelope 8, 3
	octave 5
	note C_,2
	volume_envelope 4, 3
	note C_,2
	volume_envelope 8, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
	volume_envelope 8, 3
	octave 6
	note C_,2
	volume_envelope 4, 3
	note C_,2
	volume_envelope 8, 3
	octave 5
	note G_,2
	volume_envelope 4, 3
	note G_,2
; P1-7
	volume_envelope 8, 3
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 8, 3
	note A_,2
	volume_envelope 4, 3
	note A_,2
	volume_envelope 8, 3
	octave 6
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 8, 3
	octave 5
	note A_,2
	volume_envelope 4, 3
	note A_,2
; P1-8
	volume_envelope 8, 3
	note E_,2
	volume_envelope 4, 3
	note E_,2
	volume_envelope 8, 3
	note B_,2
	volume_envelope 4, 3
	note B_,2
	volume_envelope 8, 3
	octave 6
	note E_,2
	volume_envelope 4, 3
	note E_,2
	volume_envelope 8, 3
	octave 5
	note B_,2
	volume_envelope 4, 3
	note B_,2
; P1-9
	volume_envelope 8, 3
	note C#,2
	volume_envelope 4, 3
	note C#,2
	volume_envelope 8, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
	volume_envelope 8, 3
	note A#,2
	volume_envelope 4, 3
	note A#,2
	volume_envelope 8, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
; P1-10
	volume_envelope 8, 3
	note C_,2
	volume_envelope 4, 3
	note C_,2
	volume_envelope 8, 3
	note F_,2
	volume_envelope 4, 3
	note F_,2
	volume_envelope 8, 3
	octave 6
	note C_,2
	volume_envelope 4, 3
	note C_,2
	volume_envelope 8, 3
	octave 5
	note F_,2
	volume_envelope 4, 3
	note F_,2
	sound_ret 
.sub12
	volume_envelope 9, 3
	octave 5
	note G_,2
	volume_envelope 4, 3
	note G_,2
	volume_envelope 8, 3
	note F_,2
	volume_envelope 4, 3
	note F_,2
	volume_envelope 8, 3
	note D_,2
	volume_envelope 4, 3
	note D_,2
	volume_envelope 8, 3
	note G_,2
	volume_envelope 4, 3
	note G_,2
	sound_ret 
;----------------------------------------
m_shion_Ch2:
;----------------------------------------
; P2-1
	duty_cycle 1
	vibrato 8, 2, 4
	stereo_panning 	TRUE, TRUE
; P2-2
.mero2
	note_type 12, 10, 3
	octave 5
	note C_,2
	volume_envelope 6, 3
	note C_,2
	volume_envelope 10, 3
	note G_,2
	volume_envelope 6, 3
	note G_,2
	volume_envelope 10, 3
	note B_,2
	volume_envelope 6, 3
	note B_,2
	volume_envelope 10, 3
	note F#,2
	volume_envelope 6, 3
	note F#,2
	db sound_loop_cmd, 3
	dw .mero2
; P2-3
; P2-4
; P2-5
	volume_envelope 10, 3
	note C_,2
	volume_envelope 6, 3
	note C_,2
	volume_envelope 10, 3
	note G_,2
	volume_envelope 6, 3
	note G_,2
	volume_envelope 10, 3
	note B_,2
	volume_envelope 6, 3
	note B_,2
	volume_envelope 10, 3
	octave 6
	note D_,2
	volume_envelope 6, 3
	note D_,2
; P2-6
.loop
	volume_envelope 11, 5
	db sound_call_cmd
	dw .mero6_10
; P2-11
	octave 2
	note F#,4
	octave 3
	note C_,4
	note F#,4
	note A_,4
; P2-12
	octave 2
	note G_,4
	octave 3
	note C_,4
	note D_,4
	note G_,4
; P2-13
	note F_,4
	note D_,4
	octave 2
	note B_,4
	note G_,4
; P2-14
	db sound_call_cmd
	dw .mero6_10
; P2-11
	octave 2
	note G_,4
	octave 3
	note C_,4
	note F_,4
	note G_,4
; P2-12
	note C_,4
	note F_,4
	note G_,4
	note F_,4
; P2-13
	note C_,4
	note E_,4
	note G_,4
	octave 4
	note C_,4
; P2-22
	volume_envelope 11, 7
	octave 2
	note F_,16
; P2-23
	note C_,16
; P2-24
	note F_,16
; P2-25
	note C_,16
; P2-26
	note F_,16
; P2-27
	note F#,16
; P2-28
	note G_,16
; P2-29
	octave 1
	note G_,8
	volume_envelope 5, 7
	octave 5
	note D_,1
	note F_,1
	note G_,6
; P2-30
	db sound_loop_cmd, 0
	dw .loop
.mero6_10
	octave 2
	note C_,4
	note G_,4
	octave 3
	note E_,4
	octave 2
	note G_,4
; P2-7
	note D_,4
	note A_,4
	octave 3
	note F_,4
	octave 2
	note A_,4
; P2-8
	note E_,4
	note B_,4
	octave 3
	note G_,4
	note F_,4
; P2-9
	note E_,4
	note C#,4
	octave 2
	note A#,4
	note G_,4
; P2-10
	note F_,4
	octave 3
	note C_,4
	note A_,4
	note C_,4
	sound_ret 
;----------------------------------------
m_shion_Ch3:
;----------------------------------------
; P3-1
	vibrato 18, 2, 4
	note_type 12, 1, 3
	stereo_panning 	TRUE, FALSE
; P3-2
	rest 16
; P3-3
	rest 16
; P3-4
	rest 16
; P3-5
	rest 8
	octave 5
	note E_,4
	note F_,4
; P3-6
.loop
	volume_envelope 1, 2
	octave 5
	note G_,4
	rest 4
	note G_,4
	rest 4
; P3-7
	note E_,4
	rest 4
	note E_,4
	note F_,4
; P3-8
	note G_,4
	note F_,4
	note E_,4
	note B_,4
; P3-9
	note C#,8
	note D_,4
	note E_,4
; P3-10
	note F_,10
	note G_,2
	note F_,2
	note E_,2
; P3-11
	note D_,8
	octave 4
	note A_,4
	octave 5
	note D_,4
; P3-12
	note E_,16
; P3-13
	note D_,12
	note E_,2
	note F_,2
; P3-14
	note G_,4
	rest 4
	note G_,4
	rest 4
; P3-15
	note E_,4
	rest 4
	note E_,4
	note F_,4
; P3-16
	note G_,4
	note F_,4
	note E_,4
	note B_,4
; P3-17
	note C#,8
	note D_,4
	note E_,4
; P3-18
	note F_,10
	note G_,2
	note F_,2
	note E_,2
; P3-19
	note D_,12
	note C_,2
	note D_,2
; P3-20
	note C_,16
; P3-21 -tie
	note C_,12
	rest 4
; P3-22
	volume_envelope 2, 4
	note A_,2
	note G_,2
	note A_,2
	note B_,2
	octave 6
	note C_,4
	octave 5
	note G_,4
; P3-23
	note F_,4
	note E_,4
	note D_,4
	note C_,4
; P3-24
	note A_,2
	note G_,2
	note A_,2
	note B_,2
	octave 6
	note C_,4
	octave 5
	note G_,4
; P3-25
	octave 6
	note F_,4
	note E_,4
	note D_,4
	note C_,4
; P3-26
	octave 5
	note A_,2
	note G_,2
	note A_,2
	note B_,2
	octave 6
	note C_,4
	octave 5
	note G_,4
; P3-27
	note A_,2
	note G_,2
	note A_,2
	note B_,2
	octave 6
	note C_,4
	note C#,4
; P3-28
	note D_,12
	note C_,4
; P3-29
	octave 5
	note B_,12
	note E_,2
	note F_,2
; P3-30
	db sound_loop_cmd, 0
	dw .loop



