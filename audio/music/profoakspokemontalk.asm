Music_ProfOaksPokemonTalk:
	channel_count 3
	channel 1, m_okido_Ch1
	channel 2, m_okido_Ch2
	channel 3, m_okido_Ch3
;	include	group.def
;bank3d	group	G_MUSIC4
;	;
;	;	m_okido
;	;
;	;	Converting on Fri Aug 13 14:07:15 1999
;	;
;	;				by ver 1.01
;	;
;	public	musm_okido
;musm_okido:







;----------------------------------------
m_okido_Ch1:
;----------------------------------------
	tempo 164
	volume 7, 7
; P1-1
	stereo_panning 	FALSE, TRUE
	vibrato 16, 2, 5
	duty_cycle 0
	note_type 12, 10, 7
; P1-2
	rest 8
	octave 3
	note B_,1
	octave 4
	note C#,1
	note D#,1
	note E_,1
	note C#,1
	note D#,1
	note E_,1
	note F#,1
.loop
; P1-3
	note D#,6
	note C#,1
	octave 3
	note B_,1
	note F#,1
	note G#,1
	note F#,1
	rest 1
	note F#,1
	rest 1
	note A_,1
	note A#,1
; P1-4
	note B_,2
	note F#,1
	note G#,1
	note F#,1
	rest 1
	note F#,1
	rest 1
	note F#,1
	note G#,1
	note F#,1
	rest 1
	note A#,4
; P1-5
	octave 4
	note D#,6
	note C#,1
	octave 3
	note B_,1
	note G#,1
	note B_,1
	note D#,1
	rest 1
	note D#,1
	rest 1
	note A#,1
	note B_,1
; P1-6
	note F#,1
	note A#,1
	note D#,1
	rest 1
	note D#,1
	rest 1
	note F#,1
	note A#,1
	note D#,1
	rest 1
	note D#,1
	rest 1
	note A#,4
; P1-7
	note E_,2
	octave 2
	note B_,1
	octave 3
	note E_,1
	note G#,2
	note E_,1
	note G#,1
	note B_,1
	octave 4
	note C#,1
	octave 3
	note B_,1
	octave 4
	note C#,1
	octave 3
	note B_,4
; P1-8
	note F#,2
	note D#,1
	note F#,1
	note B_,2
	note F#,1
	note B_,1
	octave 4
	note D#,1
	note E_,1
	note D#,1
	note E_,1
	note D#,4
; P1-9
	octave 3
	note A#,2
	octave 4
	note C#,2
	note E_,2
	note F#,2
	note C#,2
	note E_,2
	note F#,2
	note E_,2
; P1-10
	note C#,2
	octave 3
	note A#,1
	rest 1
	note B_,1
	rest 1
	octave 4
	note C#,1
	rest 1
	note D#,1
	rest 1
	note E_,1
	rest 1
	note F_,1
	rest 1
	note F#,1
	rest 1
; P1-11
	db sound_loop_cmd, 0
	dw .loop
;----------------------------------------
m_okido_Ch2:
;----------------------------------------
; P2-1
	vibrato 16, 2, 4
	duty_cycle 0
	note_type 12, 10, 14
	stereo_panning 	TRUE, TRUE
; P2-2
	octave 3
	note B_,1
	octave 4
	note C#,1
	note D#,1
	note E_,1
	note C#,1
	note D#,1
	note E_,1
	note F#,1
	note D#,1
	note E_,1
	note F#,1
	note G#,1
	note E_,1
	note F#,1
	note G#,1
	note A#,1
.loop
; P2-3
	note B_,6
	note A#,1
	note G#,1
	note F#,6
	note F_,1
	note F#,1
; P2-4
	note G#,4
	note F#,8
	note F#,4
; P2-5
	note G#,6
	note F#,1
	note E_,1
	note D#,6
	note D_,1
	note D#,1
; P2-6
	note E_,4
	note D#,8
	note D#,4
; P2-7
	note E_,6
	octave 3
	note B_,1
	octave 4
	note E_,1
	note G#,8
; P2-8
	note F#,6
	note D#,1
	note F#,1
	note B_,8
; P2-9
	note A#,4
	note B_,2
	note A#,2
	note G#,4
	note A#,2
	note G#,2
; P2-10
	note F#,2
	note C#,1
	rest 1
	note D#,1
	rest 1
	note E_,1
	rest 1
	note F#,1
	rest 1
	note G_,1
	rest 1
	note G#,1
	rest 1
	note A#,1
	rest 1
; P2-11
	db sound_loop_cmd, 0
	dw .loop
;----------------------------------------
m_okido_Ch3:
;----------------------------------------
; P3-1
	vibrato 16, 3, 8
	note_type 12, 1, 5
	stereo_panning 	TRUE, FALSE
; P3-2
	rest 8
	octave 3
	note F#,1
	note E_,1
	note D#,1
	note C#,1
	note E_,1
	note D#,1
	note C#,1
	octave 2
	note A#,1
.loop
; P3-3
	note B_,6
	octave 3
	note D#,1
	note F#,1
	note B_,6
	note D#,1
	note C#,1
; P3-4
	octave 2
	note B_,4
	octave 3
	note B_,8
	octave 4
	note D#,4
; P3-5
	octave 3
	note G#,6
	note D#,1
	note G#,1
	octave 2
	note G#,6
	octave 3
	note D#,1
	note G#,1
; P3-6
	note D#,6
	note F#,2
	note A#,2
	note G#,2
	note F#,2
	note D#,2
; P3-7
	note E_,2
	rest 4
	note E_,1
	note E_,1
	note E_,1
	rest 1
	note E_,1
	rest 1
	note B_,4
; P3-8
	note F#,2
	rest 4
	note F#,1
	note F#,1
	octave 2
	note B_,1
	rest 1
	note B_,1
	rest 1
	octave 3
	note B_,4
; P3-9
	note F#,2
	octave 4
	note F#,2
	octave 3
	note E_,2
	octave 4
	note E_,2
	octave 3
	note C#,2
	octave 4
	note C#,2
	octave 2
	note A#,2
	octave 3
	note A#,2
; P3-10
	octave 2
	note F#,2
	octave 3
	note A#,1
	rest 1
	note G#,1
	rest 1
	note F#,1
	rest 1
	note E_,1
	rest 1
	note D#,1
	rest 1
	note C#,1
	rest 1
	octave 2
	note A#,1
	rest 1
; P3-11
	db sound_loop_cmd, 0
	dw .loop



