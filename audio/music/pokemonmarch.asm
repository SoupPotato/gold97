Music_PokemonMarch:
march042:
	channel_count 4
	channel 1, march042_Ch1
	channel 2, march042_Ch2
	channel 3, march042_Ch3
	channel 4, march042_Ch4
;	include	group.def
;bank3d	group	G_MUSIC4
;
;;	march042
;
;;	Converting on Fri Jun 11 18:23:23 1999
;
;;				by ver 1.02
;
;	public	musmarch
;musmarch:








;----------------------------------------
march042_Ch1:
;----------------------------------------
	tempo 144
	volume 7, 7
	duty_cycle 3
	note_type 8, 11, 2
	pitch_offset 1
.loop10
; P1-1
	db sound_call_cmd
	dw .sub1_1_1
	note D#,2
	note C_,2
	note D#,2
	note C_,2
; P1-2
	db sound_call_cmd
	dw .sub1_1_1
	note D#,2
	note C_,2
	note D#,2
	note G_,2
; P1-3
	db sound_call_cmd
	dw .sub1_1_1
	note C_,2
	note C_,2
	note D#,2
	note C_,2
; P1-4
	db sound_call_cmd
	dw .sub1_1_1
	note D#,2
	note C_,2
	note C#,2
	note D#,2
; P1-5
	db sound_call_cmd
	dw .sub1_5_5
	note F_,2
	note D_,2
	note F_,2
	note D_,2
; P1-6
	db sound_call_cmd
	dw .sub1_5_5
	note F_,2
	note D_,2
	note F_,2
	note A_,2
; P1-7
	db sound_call_cmd
	dw .sub1_5_5
	note D_,2
	note D_,2
	note F_,2
	note D_,2
; P1-8
	db sound_call_cmd
	dw .sub1_5_5
	note F_,2
	note D_,2
	note F_,2
	note G_,2
; P1-9
	db sound_call_cmd
	dw .sub1_5_5
	note F_,2
	note D_,2
	note F_,2
	note D_,2
; P1-10
	db sound_call_cmd
	dw .sub1_1_1
	note D#,2
	note C_,2
	note D#,2
	note C_,2
; P1-11
	octave 2
	note A#,2
	note A#,2
	octave 3
	note C_,2
	note D_,2
	note C#,2
	note C_,2
	octave 2
	note A#,2
	rest 4
	note D#,2
	rest 4
; P1-12
	octave 3
	note D#,2
	note D#,2
	note F_,2
	note G_,2
	note F#,2
	note F_,2
	note D#,4
	note F_,2
	note G_,4
	note A#,2
	db sound_loop_cmd, 0
	dw .loop10
.sub1_1_1
; P1-1
	rest 4
	octave 3
	note D#,1
	note D_,1
	note D#,2
	rest 2
	note D#,2
	note D#,2
	rest 2
	sound_ret 
.sub1_5_5
; P1-5
	rest 4
	note F_,1
	note E_,1
	note F_,2
	rest 2
	note F_,2
	note F_,2
	rest 2
	sound_ret 
;----------------------------------------
march042_Ch2:
;----------------------------------------
; P2-1
	duty_cycle 2
	vibrato 16, 2, 2
.loop20
	note_type 12, 12, 7
	octave 3
	note G#,12
	note_type 8, 12, 3
	note D#,2
	note G#,2
	note A#,2
; P2-2
	octave 4
	note C_,2
	rest 16
	rest 6
; P2-3
	note_type 8, 12, 7
	octave 3
	note G#,16
	note_type 8, 12, 3
	note D#,2
	note G#,4
	note A#,2
; P2-4
	octave 4
	note C_,4
	note C#,2
	note C_,4
	note C#,2
	note C_,4
	note C#,2
	note C_,2
	octave 3
	note A#,2
	note G#,2
; P2-5
	note_type 8, 12, 7
	note A#,16
	note_type 8, 12, 3
	note A#,2
	note F_,2
	note A#,2
	octave 4
	note C_,2
; P2-6
	note D_,2
	rest 16
	rest 6
; P2-7
	note_type 8, 12, 7
	octave 3
	note A#,16
	note_type 8, 12, 3
	note F_,2
	note A#,4
	octave 4
	note C_,2
; P2-8
	note D_,4
	note D#,2
	note D_,4
	note D#,2
	note D_,4
	note D#,2
	note D_,2
	note C_,2
	octave 3
	note B_,2
; P2-9
	note_type 8, 12, 7
	note A#,16
	note_type 8, 12, 3
	note A_,2
	note A#,4
	octave 4
	note C_,2
; P2-10
	note_type 8, 12, 7
	octave 3
	note G#,16
	note_type 8, 12, 3
	note A#,2
	note G#,4
	note F_,2
; P2-11
	note D#,2
	note D#,2
	note F_,2
	note G_,2
	note F#,2
	note F_,2
	note D#,2
	rest 2
	octave 4
	note D#,1
	note D_,1
	note D#,1
	rest 5
; P2-12
	octave 3
	note G_,2
	note G_,2
	note G#,2
	note A#,2
	note A_,2
	note G#,2
	note G_,2
	rest 2
	octave 4
	note G_,1
	note F#,1
	note G_,1
	rest 5
	db sound_loop_cmd, 0
	dw .loop20
;----------------------------------------
march042_Ch3:
;----------------------------------------
	note_type 8, 1, 6
.loop30
; P3-1
	db sound_call_cmd
	dw .sub3_1_1
	rest 2
	octave 4
	note D#,2
; P3-2
	db sound_call_cmd
	dw .sub3_1_1
	octave 4
	note G#,2
	note D#,2
; P3-3
	db sound_call_cmd
	dw .sub3_1_1
	rest 2
	octave 4
	note D#,2
; P3-4
	octave 3
	note G#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note D#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note G#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note D#,2
	note G_,2
	note G#,2
; P3-5
.loop31
	octave 3
	note A#,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note F_,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note G_,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note A_,2
	rest 1
	octave 4
	note F_,2
	rest 1
	db sound_loop_cmd, 3
	dw .loop31
; P3-8
	octave 3
	note A#,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note F_,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note A#,2
	rest 2
	octave 4
	note F_,2
	note D_,2
	note C_,2
	octave 3
	note B_,2
; P3-9
	note A#,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note F_,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note G_,2
	rest 2
	octave 4
	note F_,2
	octave 3
	note F_,2
	note G_,2
	note A#,2
; P3-10
	note G#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note D#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note F_,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note G#,2
	rest 2
	octave 4
	note C_,2
; P3-11
	note D#,2
	note D#,2
	note F_,2
	note G_,2
	note F#,2
	note F_,2
	note D#,2
	rest 4
	octave 3
	note D#,2
	rest 4
; P3-12
	octave 4
	note G_,2
	note G_,2
	note G#,2
	note A#,2
	note A_,2
	note G#,2
	note G_,2
	rest 2
	note D#,2
	note F_,2
	rest 2
	note G#,2
	db sound_loop_cmd, 0
	dw .loop30
.sub3_1_1
; P3-1
	octave 3
	note G#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note D#,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note F_,2
	rest 2
	octave 4
	note D#,2
	octave 3
	note G_,2
	sound_ret 
;----------------------------------------
march042_Ch4:
;----------------------------------------
	toggle_noise 0
	drum_speed 8
.loop40
; P4-1
	db sound_call_cmd
	dw .sub4_1_1
; P4-2
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 2,5
	drum_speed 6
	drum_note 4,1
	drum_note 4,1
	drum_note 3,1
	drum_note 3,1
; P4-3
	drum_speed 8
	db sound_call_cmd
	dw .sub4_1_1
; P4-4
	db sound_call_cmd
	dw .sub3_4_4
; P4-5
	db sound_call_cmd
	dw .sub4_1_1
; P4-6
	db sound_call_cmd
	dw .sub3_4_4
; P4-7
	db sound_call_cmd
	dw .sub4_1_1
; P4-8
	db sound_call_cmd
	dw .sub3_4_4
; P4-9
	db sound_call_cmd
	dw .sub4_1_1
; P4-10
	db sound_call_cmd
	dw .sub3_4_4
; P4-11
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 2,2
	drum_note 2,6
	drum_note 1,2
	drum_speed 4
	rest 5
	drum_speed 6
	drum_note 3,1
	drum_note 3,1
; P4-12
	drum_speed 8
	db sound_call_cmd
	dw .sub3_4_4
	db sound_loop_cmd, 0
	dw .loop40
.sub4_1_1
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 4,2
	drum_note 4,2
	drum_note 3,2
	drum_note 3,2
	sound_ret 
.sub3_4_4
; P4-4
	drum_note 2,4
	drum_note 2,2
	drum_note 2,4
	drum_note 2,4
	drum_note 2,4
	drum_note 3,2
	drum_note 4,2
	drum_note 3,2
	sound_ret 


