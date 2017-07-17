#################################################################################
# COMMANDS                                                                      #
#################################################################################

shell:
	docker-compose run --rm hugo /bin/ash

server:
	docker-compose run --rm --service-ports hugo hugo server --buildDrafts --watch=true --source="/src" --destination="/output" --bind="0.0.0.0"

compile:
	docker-compose run --rm -e HUGO_WATCH=false hugo /run.sh