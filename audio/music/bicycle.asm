Music_Bicycle:
	musicheader 4, 1, town04_Ch1
	musicheader 1, 2, town04_Ch2
	musicheader 1, 3, town04_Ch3
	musicheader 1, 4, town04_Ch4
;	include	group.def
;bank3d	group	G_MUSIC4
;
;;	town04
;
;;	Converting on Thu May 27 07:58:47 1999
;
;;				by ver 1.00
;
;	public	mustown14
;mustown14:








;----------------------------------------
town04_Ch1:
;----------------------------------------
	tempo 144
	volume 7, 7
	duty_cycle 3
	pitch_offset 1
	stereo_panning FALSE, TRUE
	vibrato 8, 1, 5
; P1-1
	note_type 12, 11, 4
	octave 3
	note B_,6
	note A_,6
	note G_,4
; P1-2
	note_type 12, 11, 0
	note A_,6
	note_type 12, 11, 6
	note A_,8
	note_type 12, 11, 2
	note F#,2
.loop10
	stereo_panning FALSE, TRUE
	note_type 12, 11, 2
; P1-3
	note G_,2
	note G_,2
	note E_,2
	note E_,2
	note F#,1
	note E_,1
	note D#,2
	note D_,2
	note D_,2
; P1-4
	note E_,2
	note E_,2
	note C_,2
	note C_,2
	octave 2
	note B_,2
	note G_,2
	note A_,2
	note B_,2
; P1-5
	octave 3
	note C_,2
	note C_,2
	note E_,2
	note E_,2
	note C#,2
	note E_,2
	note F#,2
	note E_,2
; P1-6
	note D_,2
	note E_,2
	note D_,2
	note C#,2
	note D_,2
	note D_,2
	note C#,2
	note D_,2
; P1-7
	note G_,2
	note G_,2
	note E_,2
	note E_,2
	note F#,1
	note E_,1
	note D#,2
	note D_,2
	note D_,2
; P1-8
	note E_,2
	note E_,2
	note C_,2
	note C_,2
	octave 2
	note B_,2
	note B_,2
	note A#,2
	note B_,2
; P1-9
	octave 3
	note C_,2
	octave 2
	note B_,2
	octave 3
	note C_,2
	note E_,2
	note C_,2
	note E_,2
	note F#,2
	note G_,2
; P1-10
	note F#,2
	note_type 12, 8, 2
	note F#,2
	note_type 12, 11, 2
	note A_,2
	note G_,2
	note F#,2
	note G_,2
	note G#,2
	note A_,2
; P1-11
	stereo_panning TRUE, FALSE
	note_type 12, 11, 6
	note B_,4
	note G_,4
	octave 4
	note D_,4
	octave 3
	note G_,4
; P1-12
	note A_,4
	note F#,4
	octave 4
	note D_,4
	octave 3
	note F#,4
; P1-13
	note G_,4
	note E_,4
	octave 4
	note C_,4
	octave 3
	note E_,4
; P1-14
	note F#,4
	note D_,2
	note F#,2
	note G_,2
	note G#,2
	note A_,4
; P1-15
	octave 4
	note D_,2
	octave 3
	note B_,2
	note G_,2
	note B_,2
	octave 4
	note D_,2
	note G_,2
	note D_,2
	octave 3
	note B_,2
; P1-16
	octave 4
	note C_,2
	octave 3
	note A_,2
	note F#,2
	note A_,2
	octave 4
	note C_,2
	note F#,2
	note C_,2
	octave 3
	note A_,2
; P1-17
	note G_,2
	note E_,2
	note C_,2
	note E_,2
	note G_,2
	note G#,2
	note A_,2
	note B_,2
; P1-18
	octave 4
	note C_,2
	note C_,2
	octave 3
	note A_,2
	note G_,2
	note F#,2
	note G_,2
	note G#,2
	note A_,2
	db sound_loop_cmd, 0
	dw .loop10
;----------------------------------------
town04_Ch2:
;----------------------------------------
	duty_cycle 3
	vibrato 9, 2, 4
; P2-1
	stereo_panning TRUE, FALSE
	note_type 12, 12, 6
	octave 4
	note D_,6
	note C_,6
	octave 3
	note B_,4
; P2-2
	note_type 12, 12, 2
	octave 4
	note D_,2
	note D_,1
	note E_,1
	note D_,2
	note D_,1
	note E_,1
	note D_,2
	note_type 12, 12, 3
	note C_,2
	octave 3
	note B_,2
	note A_,2
.loop20
	stereo_panning TRUE, TRUE
; P2-3
	duty_cycle 2
	note_type 12, 12, 4
	octave 3
	note B_,4
	note G_,4
	note A_,4
	note F#,4
; P2-4
	note_type 12, 12, 3
	note G_,2
	note F#,2
	note E_,2
	note F#,2
	note_type 12, 12, 5
	note D_,8
; P2-5
	note_type 12, 12, 4
	note E_,4
	note G_,4
	note_type 12, 12, 3
	note E_,2
	note B_,2
	note A_,2
	note G_,2
; P2-6
	note F#,2
	note G_,2
	note A_,2
	note G_,2
	note_type 12, 12, 5
	note F#,8
; P2-7
	note_type 12, 12, 4
	note B_,4
	note G_,4
	note A_,4
	note F#,4
; P2-8
	note_type 12, 12, 3
	note G_,2
	note F#,2
	note E_,2
	note F#,2
	note_type 12, 12, 5
	note D_,8
; P2-9
	note_type 12, 12, 4
	note E_,4
	note G_,4
	note_type 12, 12, 3
	note E_,2
	octave 4
	note E_,2
	note D_,2
	note C_,2
; P2-10
	octave 3
	note B_,2
	octave 4
	note C_,2
	note D_,2
	note E_,2
	note_type 12, 12, 7
	note F#,8
	stereo_panning FALSE, TRUE
; P2-11
	db sound_call_cmd
	dw .sub11
; P2-14
	note F#,4
	note_type 12, 12, 3
	note A_,2
	note D_,2
	note E_,2
	note F_,2
	note F#,4
	note_type 12, 12, 7
; P2-15
	db sound_call_cmd
	dw .sub11
; P2-18
	note F#,4
	note_type 12, 12, 3
	note A_,2
	note B_,2
	note A_,2
	note G_,2
	note F#,4
	db sound_loop_cmd, 0
	dw .loop20
.sub11
; P2-11
	note G_,6
	note B_,6
	note G_,4
; P2-12
	note F#,6
	note A_,6
	note F#,4
; P2-13
	note E_,6
	note G_,6
	note E_,4
	sound_ret 
;----------------------------------------
town04_Ch3:
;----------------------------------------
; P3-1
	note_type 12, 2, 5
	rest 16
; P3-2
	octave 2
	note A_,2
	octave 3
	note C_,2
	octave 2
	note B_,2
	octave 3
	note D_,2
	note C_,2
	note E_,2
	note D_,2
	octave 2
	note A_,1
	rest 1
.loop30
; P3-3
	db sound_call_cmd
	dw .sub31
; P3-5
	note C_,1
	rest 1
	note G_,1
	rest 1
	note E_,1
	rest 1
	note G_,1
	rest 1
	note C#,1
	rest 1
	note G_,1
	rest 1
	note E_,1
	rest 1
	note G_,1
	rest 1
; P3-6
	note D_,1
	rest 1
	note F#,1
	rest 1
	octave 2
	note A_,1
	rest 1
	octave 3
	note F#,1
	rest 1
	note D_,1
	rest 1
	note D_,1
	rest 1
	note C#,1
	rest 1
	note C_,1
	rest 1
; P3-7
	db sound_call_cmd
	dw .sub31
; P3-9
	octave 2
	note G_,1
	rest 1
	octave 3
	note C_,1
	rest 1
	octave 2
	note E_,1
	rest 1
	octave 3
	note C_,1
	rest 1
	octave 2
	note G_,1
	rest 1
	octave 3
	note C_,1
	rest 1
	octave 2
	note E_,1
	rest 1
	octave 3
	note C_,1
	rest 1
; P3-10
	octave 2
	note F#,1
	rest 1
	note A_,1
	rest 1
	note D_,1
	rest 1
	note A_,1
	rest 1
	octave 3
	note D_,1
	rest 1
	note C_,1
	rest 1
	octave 2
	note B_,1
	rest 1
	note A_,1
	rest 1
; P3-11
.loop32
	note G_,1
	rest 1
	note B_,1
	rest 1
	note D_,1
	rest 1
	note B_,1
	rest 1
	note G_,1
	rest 1
	note B_,1
	rest 1
	note D_,1
	rest 1
	note B_,1
	rest 1
; P3-12
	note F#,1
	rest 1
	note A_,1
	rest 1
	note D_,1
	rest 1
	note A_,1
	rest 1
	note F#,1
	rest 1
	note A_,1
	rest 1
	note D_,1
	rest 1
	note A_,1
	rest 1
; P3-13
	note E_,1
	rest 1
	note G_,1
	rest 1
	note C_,1
	rest 1
	note G_,1
	rest 1
	note E_,1
	rest 1
	note G_,1
	rest 1
	note C_,1
	rest 1
	note G_,1
	rest 1
; P3-14
	note F#,1
	rest 1
	note A_,1
	rest 1
	note D_,1
	rest 1
	note A_,1
	rest 1
	note F#,1
	rest 1
	octave 3
	note C_,1
	rest 1
	octave 2
	note B_,1
	rest 1
	note A_,1
	rest 1
	db sound_loop_cmd, 2
	dw .loop32
	db sound_loop_cmd, 0
	dw .loop30
.sub31
; P3-3
	octave 2
	note G_,1
	rest 1
	octave 3
	note G_,1
	rest 1
	note D_,1
	rest 1
	note G_,1
	rest 1
	octave 2
	note G_,1
	rest 1
	octave 3
	note F#,1
	rest 1
	note D_,1
	rest 1
	note F#,1
	rest 1
; P3-4
	octave 2
	note G_,1
	rest 1
	octave 3
	note E_,1
	rest 1
	note C_,1
	rest 1
	note E_,1
	rest 1
	octave 2
	note G_,1
	rest 1
	octave 3
	note D_,1
	rest 1
	octave 2
	note B_,1
	rest 1
	octave 3
	note D_,1
	rest 1
	sound_ret 
;----------------------------------------
town04_Ch4:
;----------------------------------------
	toggle_noise 0
; P4-1
	drum_speed 12
	rest 16
	rest 16
.loop40
	rest 2
.loop41
	stereo_panning TRUE, FALSE
; P4-2
	drum_note 8,4
	db sound_loop_cmd, 12
	dw .loop41
; P4-3
	drum_note 8,4
	drum_note 8,4
	stereo_panning TRUE, TRUE
	drum_note 8,2
	drum_note 8,2
	drum_note 8,2
	db sound_loop_cmd, 0
	dw .loop40


