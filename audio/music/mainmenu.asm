Music_MainMenu:
	channel_count 4
	channel 1, start03_Ch1
	channel 2, start03_Ch2
	channel 3, start03_Ch3
	channel 4, start03_Ch4
;	include	group.def
;bank3d	group	G_MUSIC4
;
;;	field03
;
;;	Converting on Thu May 27 07:58:32 1999
;
;;				by ver 1.00
;
;	public	musstart
;musstart:








;----------------------------------------
start03_Ch1:
;----------------------------------------
	tempo 160
	volume 7, 7
	duty_cycle 3
	pitch_offset 1
	vibrato 16, 1, 5
; P1-1
	note_type 12, 0, 15
	octave 3
	note D#,8
.loop10
	note_type 12, 9, 2
	octave 3
	note D_,6
	note D_,1
	note D_,1
	note D_,2
	note D_,2
	note D_,4
	db sound_loop_cmd, 2
	dw .loop10
; P1-2
.loop11
	note E_,6
	note E_,1
	note E_,1
	note E_,2
	note E_,2
	note E_,4
	note C_,6
	note C_,1
	note C_,1
	note C_,2
	note C_,2
	note_type 12, 9, 4
	note C#,4
	db sound_loop_cmd, 0
	dw .loop10
;----------------------------------------
start03_Ch2:
;----------------------------------------
	duty_cycle 3
; P2-1
	note_type 12, 0, 15
	octave 3
	note G#,8
.loop20
	note_type 12, 10, 2
	octave 3
	note G_,6
	note G_,1
	note G_,1
	note G_,2
	note G_,2
	note G_,4
	db sound_loop_cmd, 2
	dw .loop20
.loop21
	octave 3
	note A_,6
	note A_,1
	note A_,1
	note A_,2
	note A_,2
	note A_,4
	octave 3
	note F_,6
	note F_,1
	note F_,1
	note F_,2
	note F_,2
	note_type 12, 10, 4
	note F#,4
	db sound_loop_cmd, 0
	dw .loop20
;----------------------------------------
start03_Ch3:
;----------------------------------------
; P3-1
	note_type 12, 2, 5
	rest 8
.loop30
	octave 2
	note G_,1
	rest 5
	note G_,1
	note G_,1
	note G_,1
	rest 1
	note G_,1
	rest 1
	note G_,1
	rest 3
	db sound_loop_cmd, 2
	dw .loop30
; P3-2
.loop31
	note A_,1
	rest 5
	note A_,1
	note A_,1
	note A_,1
	rest 1
	note A_,1
	rest 1
	note A_,1
	rest 3
	note F_,1
	rest 5
	note F_,1
	note F_,1
	note F_,1
	rest 1
	note F_,1
	rest 1
	note F#,1
	rest 3
	db sound_loop_cmd, 0
	dw .loop30
;----------------------------------------
start03_Ch4:
;----------------------------------------
	toggle_noise 3
; P4-1
	drum_speed 12
	rest 8
	rest 16
	rest 16
	rest 16
	rest 12
	drum_note 3,1
	drum_note 3,1
	drum_note 3,1
	drum_note 3,1
.loop40
	drum_note 3,6
	drum_note 3,1
	drum_note 3,1
	drum_note 3,2
	drum_note 3,2
	drum_note 3,4
	drum_note 3,6
	drum_note 3,1
	drum_note 3,1
	drum_note 3,2
	drum_note 3,2
	drum_note 4,1
	drum_note 4,1
	drum_note 3,1
	drum_note 3,1
	db sound_loop_cmd, 0
	dw .loop40


