#!/usr/bin/env -S swipl -q -g main -t halt

port_open(Port) :-
    tcp_socket(Socket),
    catch(
	tcp_connect(Socket, localhost:Port),
	_,
	fail
    ),
    tcp_close_socket(Socket).

main :-
    port_open(8080),
    writeln('port 8080 is open').
:- main.    
