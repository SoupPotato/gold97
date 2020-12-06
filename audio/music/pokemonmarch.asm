Music_PokemonMarch:
	channel_count 4
	channel 1, Music_PokemonMarch_Ch1
	channel 2, Music_PokemonMarch_Ch2
	channel 3, Music_PokemonMarch_Ch3
	channel 4, Music_PokemonMarch_Ch4

Music_PokemonMarch_Ch1:
	tempo 144
	volume 7, 7
	stereo_panning TRUE, FALSE
	duty_cycle 3
	pitch_offset 1
	note_type 8, 11, 2
.mainloop:
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	callchannel .sub1
	note C_, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note A_, 2
	callchannel .sub2
	note D_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 2
	note A#, 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	rest 4
	note D#, 2
	rest 4
	octave 3
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 4
	note F_, 2
	note G_, 4
	note A#, 2
	loopchannel 0, .mainloop

.sub1:
	rest 4
	octave 3
	note D#, 1
	note D_, 1
	note D#, 2
	rest 2
	note D#, 2
	note D#, 2
	rest 2
	sound_ret

.sub2:
	rest 4
	note F_, 1
	note E_, 1
	note F_, 2
	rest 2
	note F_, 2
	note F_, 2
	rest 2
	sound_ret

Music_PokemonMarch_Ch2:
	duty_cycle 2
	vibrato 16, 2, 2
.mainloop:
	note_type 12, 12, 7
	octave 3
	note G#, 12
	note_type 8, 12, 3
	note D#, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	rest 16
	rest 6
	note_type 8, 12, 7
	octave 3
	note G#, 16
	note_type 8, 12, 3
	note D#, 2
	note G#, 4
	note A#, 2
	octave 4
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note_type 8, 12, 7
	note A#, 16
	note_type 8, 12, 3
	note A#, 2
	note F_, 2
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	rest 16
	rest 6
	note_type 8, 12, 7
	octave 3
	note A#, 16
	note_type 8, 12, 3
	note F_, 2
	note A#, 4
	octave 4
	note C_, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note_type 8, 12, 7
	note A#, 16
	note_type 8, 12, 3
	note A_, 2
	note A#, 4
	octave 4
	note C_, 2
	note_type 8, 12, 7
	octave 3
	note G#, 16
	note_type 8, 12, 3
	note A#, 2
	note G#, 4
	note F_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	rest 2
	octave 4
	note D#, 1
	note D_, 1
	note D#, 1
	rest 5
	octave 3
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	rest 2
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	rest 5
	loopchannel 0, .mainloop

Music_PokemonMarch_Ch3:
	stereo_panning FALSE, TRUE
	note_type 8, 1, 6
.mainloop:
	callchannel .sub1
	rest 2
	octave 4
	note D#, 2
	callchannel .sub1
	octave 4
	note G#, 2
	note D#, 2
	callchannel .sub1
	rest 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note G_, 2
	note G#, 2
.loop1:
	octave 3
	note A#, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	rest 1
	octave 4
	note F_, 2
	rest 1
	loopchannel 3, .loop1
	octave 3
	note A#, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note A#, 2
	rest 2
	octave 4
	note F_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	rest 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note G_, 2
	note A#, 2
	note G#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	rest 2
	octave 4
	note C_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	rest 4
	octave 3
	note D#, 2
	rest 4
	octave 4
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	rest 2
	note D#, 2
	note F_, 2
	rest 2
	note G#, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note G#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	rest 2
	octave 4
	note D#, 2
	octave 3
	note G_, 2
	sound_ret

Music_PokemonMarch_Ch4:
	stereo_panning TRUE, FALSE
	toggle_noise 0
	drum_speed 8
.loop40
; P4-1
	db callchannel_cmd
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
	db callchannel_cmd
	dw .sub4_1_1
; P4-4
	db callchannel_cmd
	dw .sub3_4_4
; P4-5
	db callchannel_cmd
	dw .sub4_1_1
; P4-6
	db callchannel_cmd
	dw .sub3_4_4
; P4-7
	db callchannel_cmd
	dw .sub4_1_1
; P4-8
	db callchannel_cmd
	dw .sub3_4_4
; P4-9
	db callchannel_cmd
	dw .sub4_1_1
; P4-10
	db callchannel_cmd
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
	db callchannel_cmd
	dw .sub3_4_4
	db loopchannel_cmd, 0
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
