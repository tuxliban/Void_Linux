#!/bin/sh 

#RET=$(echo "" Apagar"\n" Reiniciar"\n" Bloquear"\n" Suspender"\n" Hibernar"\n" logout"\nCancelar" | dmenu -l 7 -p " Menu") 

RET=$(echo "" Apagar"\n" Reiniciar"\n" Bloquear"\n" Suspender"\n" logout"\ncancel" | dmenu -l 7 -p " Logout") 
case $RET in 
	" Apagar") 
		st -T "warning" -g "42x8+480+300" -f "Liberation Mono:size=12" -e su - root -c 'shutdown -h now'
		;; 
	" Reiniciar") 
		st -T "warning" -g "42x8+480+300" -f "Liberation Mono:size=12" -e su - root -c 'shutdown -r now'
		;;
	" Bloquear")
		slock
		;;
	" Suspender")
		st -T "warning" -g "42x8+480+300" -f "Liberation Mono:size=12" -e su - root -c zzz && slock
		;;
#	" Hibernar")
#		slock && doas ZZZ
#		;;	
	" logout") 
		pkill startdwm && xdotool key "super+shift+q" 
		;; 
	*) ;; 
esac
