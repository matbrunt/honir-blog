#################################################################################
# COMMANDS                                                                      #
#################################################################################

shell:
	docker-compose run --rm hugo /bin/ash

server:
	docker-compose run --rm --service-ports hugo hugo server --buildDrafts --watch=true --source="/src" --destination="/output" --bind="0.0.0.0"

compile:
	docker-compose run --rm -e HUGO_WATCH=false hugo /run.sh

post:
	# run with make post title=abc
	# docker-compose run --rm hugo hugo new -k posts posts/$(shell date +'%Y-%m-%d')-$(title).md
	docker-compose run --rm hugo hugo new -k posts posts/$(title).md
