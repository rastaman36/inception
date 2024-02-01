# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mochaoui <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/26 23:51:11 by mochaoui          #+#    #+#              #
#    Updated: 2024/02/01 10:19:52 by mochaoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@docker-compose -f ./docker-compose.yml up --build -d

down : 
	@docker-compose -f ./docker-compose.yml down

stop : 
	@docker-compose -f ./docker-compose.yml stop

start : 
	@docker-compose -f ./docker-compose.yml start

status : 
	@docker ps